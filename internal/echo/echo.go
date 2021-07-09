package echo

import (
	"context"
	"crypto/tls"
	"crypto/x509"
	"fmt"
	"io"
	"log"
	"net"
	"os"
	"path/filepath"

	"github.com/alta/insecure"
	"github.com/lucas-clemente/quic-go"
	"github.com/lucas-clemente/quic-go/logging"
	"github.com/lucas-clemente/quic-go/qlog"
)

const nextProtoEcho = "echo"

// Serve implements a rudimentary QUIC datagram echo server.
// It listens on addr via QUIC, accepts and echoes back datagrams received.
func Serve(addr string) error {
	cert, pool, err := localCertPool(addr)
	if err != nil {
		return err
	}

	tlsConfig := &tls.Config{
		Certificates: []tls.Certificate{cert},
		RootCAs:      pool,
		NextProtos:   []string{nextProtoEcho},
	}

	quicConfig := &quic.Config{
		EnableDatagrams: true,
	}

	qlogDir := os.Getenv("QUIC_LOG_DIRECTORY")
	if qlogDir != "" {
		quicConfig.Tracer = qlog.NewTracer(func(_ logging.Perspective, connID []byte) io.WriteCloser {
			fn := filepath.Join(qlogDir, fmt.Sprintf("server-%x.qlog", connID))
			f, err := os.Create(fn)
			if err != nil {
				log.Fatal(err)
			}
			log.Printf("server: Created qlog file: %s", fn)
			return f
		})
	}

	listener, err := quic.ListenAddr(addr, tlsConfig, quicConfig)
	if err != nil {
		return err
	}

	log.Printf("server: Listening at: %s", addr)

	for {
		sess, err := listener.Accept(context.Background())
		if err != nil {
			return err
		}
		go func(sess quic.Session) {
			log.Printf("QUIC session started: %s", sess.RemoteAddr().String())
			for {
				buf, err := sess.ReceiveMessage()
				if err != nil {
					log.Printf("server: Error: ReceiveMessage: %v\n", err)
					break
				}
				log.Printf("server: ReceiveMessage: %s\n", string(buf))
				err = sess.SendMessage(buf)
				if err != nil {
					log.Printf("server: Error: SendMessage: %v", err)
					break
				}
				log.Printf("server: SendMessage: %s\n", string(buf))
			}
		}(sess)
	}
}

// RoundTrip sends msg to addr via a QUIC datagram.
// It returns the value of the first datagram received from the remote host or an error.
// For testing purposes, this function explicitly skips TLS cert verification.
// Do not use this in production.
func RoundTrip(addr, msg string) (string, error) {
	tlsConfig := &tls.Config{
		NextProtos:         []string{nextProtoEcho},
		InsecureSkipVerify: true,
	}

	quicConfig := &quic.Config{
		EnableDatagrams: true,
	}

	sess, err := quic.DialAddr(addr, tlsConfig, quicConfig)
	if err != nil {
		return "", err
	}

	err = sess.SendMessage([]byte(msg))
	if err != nil {
		return "", err
	}
	log.Printf("client: SendMessage: %v\n", msg)

	buf, err := sess.ReceiveMessage()
	if err != nil {
		return "", err
	}
	reply := string(buf)
	log.Printf("client: ReceiveMessage: %v\n", reply)
	return reply, nil
}

func localCertPool(addr string) (tls.Certificate, *x509.CertPool, error) {
	// Start with defaults (localhost, etc.).
	sans := insecure.LocalSANs()

	hostname, _ := os.Hostname()
	if hostname != "" {
		sans = append(sans, hostname)
	}

	host, _, _ := net.SplitHostPort(addr)
	if host != "" {
		sans = append(sans, host)
	}

	cert, err := insecure.Cert(sans...)
	if err != nil {
		return cert, nil, err
	}

	pool, err := insecure.Pool(cert)
	return cert, pool, err
}

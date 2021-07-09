package Go

import (
	"github.com/alta/quic-go-mobile-example/internal/echo"
)

// Echo sends msg to addr via a QUIC datagram.
// It returns the value of the first datagram received from the remote host or an error.
// For testing purposes, this function explicitly skips TLS cert verification.
// Do not use this in production.
func Echo(addr, msg string) (string, error) {
	return echo.RoundTrip(addr, msg)
}

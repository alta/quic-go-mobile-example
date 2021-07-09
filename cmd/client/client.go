package main

import (
	"flag"
	"log"

	"github.com/alta/quic-go-mobile-example/internal/echo"
)

func main() {
	addr := flag.String("a", "localhost:4242", "address in host:port format")
	flag.Parse()
	msg := flag.Arg(0)
	if msg == "" {
		msg = "hello"
	}
	_, err := echo.RoundTrip(*addr, msg)
	if err != nil {
		log.Fatal(err)
	}
}

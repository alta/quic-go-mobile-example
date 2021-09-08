module github.com/alta/quic-go-mobile-example

go 1.17

require (
	github.com/alta/insecure v0.0.0-20210629202216-eec10269b9f1
	github.com/lucas-clemente/quic-go v0.21.1
	golang.org/x/crypto v0.0.0-20210616213533-5ff15b29337e // indirect
	golang.org/x/mobile v0.0.0-20210710064935-76c259c465ba
	golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c // indirect
	golang.org/x/text v0.3.6 // indirect
)

require (
	github.com/cheekybits/genny v1.0.0 // indirect
	github.com/francoispqt/gojay v1.2.13 // indirect
	github.com/marten-seemann/qtls-go1-15 v0.1.4 // indirect
	github.com/marten-seemann/qtls-go1-16 v0.1.3 // indirect
	github.com/marten-seemann/qtls-go1-17 v0.1.0-beta.1.2 // indirect
	golang.org/x/mod v0.4.2 // indirect
	golang.org/x/tools v0.1.2 // indirect
	golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1 // indirect
)

// replace golang.org/x/mobile => ../../ydnar/gomobile

replace golang.org/x/mobile => github.com/ydnar/gomobile v0.0.0-20210908162631-4be809c6993e

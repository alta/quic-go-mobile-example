module github.com/alta/quic-go-mobile-example

go 1.17

require (
	github.com/alta/insecure v0.0.0-20210905232608-f5263498f0b2
	github.com/lucas-clemente/quic-go v0.23.0
	golang.org/x/crypto v0.0.0-20210616213533-5ff15b29337e // indirect
	golang.org/x/mobile v0.0.0-20210710064935-76c259c465ba
	golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c // indirect
)

require (
	github.com/cheekybits/genny v1.0.0 // indirect
	github.com/francoispqt/gojay v1.2.13 // indirect
	github.com/fsnotify/fsnotify v1.5.1 // indirect
	github.com/go-task/slim-sprig v0.0.0-20210107165309-348f09dbbbc0 // indirect
	github.com/marten-seemann/qtls-go1-16 v0.1.4 // indirect
	github.com/marten-seemann/qtls-go1-17 v0.1.0 // indirect
	github.com/nxadm/tail v1.4.8 // indirect
	github.com/onsi/ginkgo v1.16.4 // indirect
	golang.org/x/mod v0.4.2 // indirect
	golang.org/x/net v0.0.0-20210428140749-89ef3d95e781 // indirect
	golang.org/x/tools v0.1.2 // indirect
	golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1 // indirect
	gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 // indirect
)

// replace golang.org/x/mobile => ../../ydnar/gomobile

replace golang.org/x/mobile => github.com/ydnar/gomobile v0.0.0-20210908205813-b15fb8cced6d

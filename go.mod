module github.com/alta/quic-go-mobile-example

go 1.16

require (
	github.com/alta/insecure v0.0.0-20210629202216-eec10269b9f1
	github.com/lucas-clemente/quic-go v0.21.1
	golang.org/x/crypto v0.0.0-20210616213533-5ff15b29337e // indirect
	golang.org/x/mobile v0.0.0-20210220033013-bdb1ca9a1e08
	golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c // indirect
	golang.org/x/text v0.3.5 // indirect
)

replace golang.org/x/mobile => github.com/ydnar/gomobile v0.0.0-20210709214616-623f8f38653c

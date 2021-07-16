// +build tools

package tools

import (
	// Blank imports for tool binaries
	_ "golang.org/x/mobile/cmd/gobind"
	_ "golang.org/x/mobile/cmd/gomobile"
)

//go:generate go install golang.org/x/mobile/cmd/gomobile
//go:generate go install golang.org/x/mobile/cmd/gobind
//go:generate gomobile init

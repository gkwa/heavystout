#!/usr/bin/env bash

# Example: code is not in git repo.

set -x
set -e
set -u

d=$(mktemp -d /tmp/myproject-XXXX)
trash="${d}-trash"

mkdir $trash

cd $d

cat >main.go <<EOF
package main

import "fmt"

func main() {
   fmt.Println("Hello, World!")
}
EOF

go mod init go.company.com/mytest

go build

bump patch

rm -rf $d $trash

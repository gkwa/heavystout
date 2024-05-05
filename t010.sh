#!/usr/bin/env bash

# Example: this works as expected, no errors.  This is happy path.

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

git init
git add -A
git commit -am Intial

git tag v0.0.1

go build

mv mytest $trash/mytest

bump patch

rm -rf $d $trash

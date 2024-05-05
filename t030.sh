#!/usr/bin/env bash

# Example: you guilhem/bump requires git tag but you don't have any tags.

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

go build

mv mytest $trash/mytest

bump patch

rm -rf $d

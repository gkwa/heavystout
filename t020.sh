#!/usr/bin/env bash

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

bump patch

git ls-files . --exclude-standard --others

rm -rf $d $trash
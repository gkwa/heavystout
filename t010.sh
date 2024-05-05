#!/usr/bin/env bash

# Example: this works as expected, no errors.  This is happy path.

set -x
set -e
set -u

r=$(date +%s)
myproject="/tmp/myproject-${r}"
mkdir $myproject && cd $myproject

bindir="${myproject}-bindir" && mkdir -p $bindir

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

mv mytest $bindir/mytest

bump patch

rm -rf $myproject
rm -rf $bindir

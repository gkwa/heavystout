#!/usr/bin/env bash

# Example: forget that code must be in git repo.

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

go build

./mytest

bump patch

rm -rf $myproject

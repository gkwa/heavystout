#!/usr/bin/env bash

# Example: forget to move dirty files out of git repo.

set -x
set -e
set -u

r=$(date +%s)
myproject="/tmp/myproject-${r}"
mkdir $myproject && cd $myproject

cat >main.go <<EOF
package main

import "fmt"

func main() {
   fmt.Println("Hello, World!")
}
EOF

go mod init go.company.com/mytest

git init && git add -A && git commit -am Intial

go build

git tag v0.0.1

./mytest

bump patch

git ls-files . --exclude-standard --others

rm -rf $myproject

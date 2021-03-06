#!/usr/bin/env bash


CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build  -o ./build/win32/vm.exe main.go

CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build  -o ./build/win64/vm.exe main.go

CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o ./build/mac/vm main.go

rm -f ./win32.zip
rm -f ./win64.zip
rm -f ./mac.zip

cp ./config.toml ./build/win32/
cp ./config.toml ./build/win64/
cp ./config.toml ./build/mac/

zip -q -r win32.zip ./build/win32
zip -q -r win64.zip ./build/win64
zip -q -r mac.zip ./build/mac

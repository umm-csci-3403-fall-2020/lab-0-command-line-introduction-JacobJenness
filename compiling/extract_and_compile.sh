#!/bin/bash
#
# Extract a tar file, compile the C program from that tar file
# and run that C program to find the Nth Prime of a given input

number=$1

tar -zxf "NthPrime.tgz"
cd ./NthPrime

gcc *.c -o NthPrime
# ./NthPrime 5
./NthPrime $1
# ./NthPrime 103

cd ..
rm -rf "$NthPrime"

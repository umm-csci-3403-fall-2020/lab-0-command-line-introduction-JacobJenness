#!/bin/bash
#
# Extract a tar file, compile the C program from that tar file
# and run that C program to find the Nth Prime of a given input

number=$1

tar -zxf "NthPrime.tgz"
cd ./NthPrime || exit

gcc ./*.c -o NthPrime
# ./NthPrime 5
./NthPrime "$number"
# ./NthPrime 103


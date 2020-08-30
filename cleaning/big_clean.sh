#!/bin/bash

tar_file=$1
SCRATCH=$(mktemp -d)

tar -zxf "$tar_file" --directory="$SCRATCH"

# remove files that contain "DELETE ME!"

# create a new tar file with the cleaned files

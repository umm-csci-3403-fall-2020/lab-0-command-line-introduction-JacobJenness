#!/bin/bash

tar_file=$1
SCRATCH=$(mktemp -d)

tar -zxf "$tar_file" --directory="$SCRATCH"

find "$SCRATCH" -type f -name "DELETE ME!" -delete

# Create a new tar file with the cleaned files
here=$(pwd)
cd $SCRATCH
tar -zcf cleaned_$tar_file.tgz "$SCRATCH"

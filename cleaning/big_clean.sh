#!/bin/bash

# Creates the "tar_file" from the command line
# Creates the temporary directory "SCRATCH"
# Creates the base name "base"
# Creates the working directory "here"
tar_file=$1
SCRATCH=$(mktemp -d)
base=$(basename "$SCRATCH/$tar_file" .tgz)
here=$(pwd)
# echo $tar_file $SCRATCH $base $here

# Extracts tar_file into SCRATCH
tar -zxf "$tar_file" -C "$SCRATCH"
# ls $SCRATCH/$base

# Finds all instances of "DELETE ME!" in SCRATCH and deletes them
grep -Rl "DELETE ME!" "$SCRATCH" | xargs rm
# ls $SCRATCH/$base

# Creates a new tar file with the cleaned files
cd "$SCRATCH"
tar -zcf cleaned_"$tar_file" "$SCRATCH/$base"
ls $SCRATCH/$base

# Move the new tar file into the pwd
mv cleaned_"$tar_file" $here
cd "$here"


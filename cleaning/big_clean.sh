#!/bin/bash

# Creates the "tar_file" from the command line
# Creates the temporary directory "SCRATCH"
# Creates the base name "base"
# Creates the working directory "here"
tar_file=$1
SCRATCH=$(mktemp -d)
base=$(basename "$tar_file" .tgz)
here=$(pwd)

# Extracts tar_file into SCRATCH
tar -xzf "$tar_file" -C "$SCRATCH"

cd "$SCRATCH" || exit

# Finds all instances of "DELETE ME!" in SCRATCH and deletes them
grep -Rl "DELETE ME!" . | xargs rm


# Creates a new tar file with the cleaned files
tar -zcf cleaned_"$tar_file" "$base"

# Move the new tar file into the pwd
mv cleaned_"$tar_file" $here
cd "$here"


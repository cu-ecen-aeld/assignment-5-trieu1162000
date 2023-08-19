#!/bin/sh

# Script to run "make distclean" from the buildroot directory

# Specify the path to the buildroot directory
BUILDROOT_DIR=./buildroot/

# Check if the buildroot directory exists
if [ -d "$BUILDROOT_DIR" ]; then
    # Change directory to buildroot directory
    cd "$BUILDROOT_DIR"

    # Run "make distclean" command
    make distclean

    echo "make distclean completed in $BUILDROOT_DIR"
else
    echo "Buildroot directory not found at $BUILDROOT_DIR"
fi

#!/bin/sh
# Written by Dan Peori <danpeori@oopo.net>
# and Mathias Lafeldt <misfire@debugon.org>

## Check for make.
make -v >/dev/null || {
    echo "ERROR: Install make before continuing."
    exit 1
}

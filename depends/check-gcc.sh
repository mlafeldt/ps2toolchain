#!/bin/sh
# Written by Dan Peori <danpeori@oopo.net>
# and Mathias Lafeldt <misfire@debugon.org>

## Check for gcc.
gcc --version >/dev/null || {
    echo >&2 "ERROR: Install gcc before continuing."
    exit 1
}

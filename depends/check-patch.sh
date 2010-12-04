#!/bin/sh
# Written by Dan Peori <danpeori@oopo.net>
# and Mathias Lafeldt <misfire@debugon.org>

## Check for patch.
patch -v >/dev/null || {
    echo >&2 "ERROR: Install patch before continuing."
    exit 1
}

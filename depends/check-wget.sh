#!/bin/sh
# Written by Dan Peori <danpeori@oopo.net>
# and Mathias Lafeldt <misfire@debugon.org>

## Check for wget.
wget -V >/dev/null || {
    echo >&2 "ERROR: Install wget before continuing."
    exit 1
}

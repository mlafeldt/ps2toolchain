#!/bin/sh
# Written by Dan Peori <danpeori@oopo.net>
# and Mathias Lafeldt <misfire@debugon.org>

## Check for git.
git --version >/dev/null || {
    echo >&2 "ERROR: Install Git before continuing."
    exit 1
}

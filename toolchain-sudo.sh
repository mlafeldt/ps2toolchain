#!/bin/bash
# Written by Dan Peori <danpeori@oopo.net>
# and Mathias Lafeldt <misfire@debugon.org>

## Enter the ps2toolchain directory.
cd "`dirname $0`" || {
    echo >&2 "ERROR: Could not enter the ps2toolchain directory."
    exit 1
}

## Set up the environment.
export PS2DEV=/usr/local/ps2dev
export PATH=$PATH:$PS2DEV/bin
export PATH=$PATH:$PS2DEV/ee/bin
export PATH=$PATH:$PS2DEV/iop/bin
export PATH=$PATH:$PS2DEV/dvp/bin
export PS2SDK=$PS2DEV/ps2sdk
export PATH=$PATH:$PS2SDK/bin

## Run the toolchain script.
./toolchain.sh $@ || {
    echo >&2 "ERROR: Could not run the toolchain script."
    exit 1
}

#!/bin/bash
# Written by Dan Peori <danpeori@oopo.net>
# and Mathias Lafeldt <misfire@debugon.org>

## Enter the ps2toolchain directory.
cd "$(dirname $0)" || {
    echo >&2 "ERROR: Could not enter the ps2toolchain directory."
    exit 1
}

## Create the build directory.
mkdir -p build || {
    echo >&2 "ERROR: Could not create the build directory."
    exit 1
}

## Enter the build directory.
cd build || {
    echo >&2 "ERROR: Could not enter the build directory."
    exit 1
}

## Fetch the depend scripts.
DEPEND_SCRIPTS=($(ls ../depends/*.sh | sort))

## Run all the depend scripts.
for SCRIPT in ${DEPEND_SCRIPTS[@]}; do
    "$SCRIPT" || {
        echo >&2 "$SCRIPT: Failed."
        exit 1
    }
done

## Fetch the build scripts.
BUILD_SCRIPTS=($(ls ../scripts/*.sh | sort))

## If specific steps were requested...
if [ $1 ]; then
    ## Run the requested build scripts.
    for STEP in $@; do
        "${BUILD_SCRIPTS[$STEP-1]}" || {
            echo >&2 "${BUILD_SCRIPTS[$STEP-1]}: Failed."
            exit 1
        }
    done
else
    ## Run all build scripts.
    for SCRIPT in ${BUILD_SCRIPTS[@]}; do
        "$SCRIPT" || {
            echo >&2 "$SCRIPT: Failed."
            exit 1
        }
    done
fi

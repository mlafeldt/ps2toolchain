#!/bin/sh
# Written by Dan Peori <danpeori@oopo.net>
# and Mathias Lafeldt <misfire@debugon.org>

## Check if $PS2DEV is set.
test $PS2DEV || {
    echo "ERROR: Set \$PS2DEV before continuing."
    exit 1
}

## Check if $PS2SDK is set.
test $PS2SDK || {
	echo "ERROR: Set \$PS2SDK before continuing."
    exit 1
}

## Check for the $PS2DEV directory.
test -d $PS2DEV || mkdir -p $PS2DEV || {
	echo "ERROR: Create $PS2DEV before continuing."
    exit 1
}

## Check for the $PS2SDK directory.
test -d $PS2SDK || mkdir -p $PS2SDK || {
    echo "ERROR: Create $PS2SDK before continuing."
    exit 1
}

## Check for $PS2DEV write permission.
test -w $PS2DEV || {
    echo "ERROR: Grant write permissions for $PS2DEV before continuing."
    exit 1
}

## Check for $PS2SDK write permission.
test -w $PS2SDK || {
    echo "ERROR: Grant write permissions for $PS2SDK before continuing."
    exit 1
}

## Check PATH.
for path in $PS2DEV/bin $PS2DEV/ee/bin $PS2DEV/iop/bin $PS2DEV/dvp/bin $PS2SDK/bin; do
	echo $PATH | grep -q $path || {
        echo "ERROR: Add $path to your path before continuing."
        exit 1
    }
done

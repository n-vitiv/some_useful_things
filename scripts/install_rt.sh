#!/bin/bash

# for correct install run with sudo

PATH_TO_SRC=$(find -name rt.c)

compile() {
    gcc $PATH_TO_SRC -o rt
    cp rt /usr/bin
    chown root:root /usr/bin/rt
    chmod +s /usr/bin/rt
    rm rt
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root -> (sudo ./scripts/install_rt.sh)"
  exit
fi

if [ -z "$PATH_TO_SRC" ]
then
    echo "Source file rt.c not found. Try to run script from project directory"
    exit
fi

echo "Compilation of rt. Path = $PATH_TO_SRC"
compile

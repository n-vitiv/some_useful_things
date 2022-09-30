#!/bin/bash

# for correct install run with sudo

gcc c++_files/rt.c -o rt
chown root:root rt
cp rt /usr/bin
chmod +s /usr/bin/rt
rm rt

#!/bin/bash

cd src &&
help2man -n "7-Zip change directory" -N -o 7zcd.1 ./7zcd   && \
help2man -n "7-Zip decrypt" -N -o 7zdec.1 ./7zdec          && \
help2man -n "7-Zip encrypt" -N -o 7zenc.1 ./7zenc          && \
help2man -n "7-Zip find" -N -o 7zfind.1 ./7zfind           && \
help2man -n "7-Zip list" -N -o 7zlist.1 ./7zlist           && \
help2man -n "7-Zip open" -N -o 7zopen.1 ./7zopen           && \
help2man -n "7-Zip pass" -N -o 7zpass.1 ./7zpass

exit ${?}


#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    cp mac-dockerfile/Dockerfile ./Dockerfile
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    cp linux-dockerfile/Dockerfile ./Dockerfile
fi

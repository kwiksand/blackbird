#!/bin/bash

if [ ! -f '/application/blackbird.conf' ]; then
    echo "Requires configuration (see blackbird.conf), exiting....."
    exit 1
fi

/application/blackbird --config /application/blackbird.conf

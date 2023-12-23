#!/bin/sh -l

if [ -n "$1" ] && [ -n "$2" ]; then
    export RAILWAY_TOKEN="$1"
    export RAILWAY_SERVICE="$2"
else
    echo "RAILWAY_TOKEN and RAILWAY_SERVICE must be defined"
fi

railway up --service ${RAILWAY_SERVICE} --detach || error_code=$?

if [ "${error_code}" -ne 0 ]; then
    exit $error_code
else
    echo "::set-output name=status::Success"
fi

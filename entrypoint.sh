#!/bin/sh
set -e

echo "Starting Evidence.dev development environment mounted on $(pwd) in the container."
echo "Provided arguments => $@"

RUN_DEV_COMMAND="npm run dev -- --host 0.0.0.0"
INSTALL_COMMAND="cp -R -v intro-pages/* pages/"

case $1 in
    --init)
        echo "Starting with a blank template project."
        if [ $# -gt 1 ];
        then
            COMMAND=${@:2}
        else
            COMMAND="$INSTALL_COMMAND && $RUN_DEV_COMMAND"
        fi
        ;;
    *)
        if [ $# -gt 0 ];
        then
            COMMAND=$@
        else
            COMMAND=$RUN_DEV_COMMAND
        fi
        ;;
esac

echo "Running command => $COMMAND"
eval $COMMAND

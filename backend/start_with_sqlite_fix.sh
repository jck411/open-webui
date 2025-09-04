#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit

# Set up environment to use pysqlite3
export PYTHONPATH="$SCRIPT_DIR/../sqlite_patch:$PYTHONPATH"

# Run the original start script
exec "$SCRIPT_DIR/start.sh" "$@"

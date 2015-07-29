#!/usr/bin/env bash

set -e

# Make .strider ephemeral. Link to /tmp to use local host io.
if [ ! -L "/data/.strider" ]; then
    rm -rf /data/.strider
    ln -s /data/.strider /tmp/strider
fi

shift
echo "Exec'ing /entry.sh $@"
exec "/entry.sh $@"

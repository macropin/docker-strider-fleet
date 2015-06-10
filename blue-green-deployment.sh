#!/usr/bin/env bash
#
# Blue/Green deployments with fleetctl - Proof of concept
#

set -e

# Config
SERVICE_NAME=${1}

#
RUNNING_SERVICES=$(fleetctl list-units --full | grep $SERVICE_NAME | grep running | awk '{ print $1 }')
DEAD_SERVICES=$(fleetctl list-units --full | grep $SERVICE_NAME | grep dead | awk '{ print $1 }')

function isRunning() {
    SERVICE=$1
    STATUS=$(fleetctl list-units --full | grep $SERVICE | awk '{ print $4 }')
    if [ "$STATUS" == "running" ]; then  
        echo 'true'
    else
        echo 'false'
    fi
}

# Start all the dead services
for SERVICE in $DEAD_SERVICES; do
    echo -n "Starting $SERVICE. "
    fleetctl start $SERVICE
done

# Sleep for some period of time, or wait for them to come up and be okay...
echo "Waiting for $DEAD_SERVICES to launch."
for SERVICE in $DEAD_SERVICES; do
    echo -n "$SERVICE is" 
    while true; do
        IS_RUNNING=$(isRunning $SERVICE)
        if [ "$IS_RUNNING" == "true" ]; then
            echo "Running!"
            break
        else
            echo -n "."
        fi
        sleep 1
    done
done

# Shutdown the old services
for SERVICE in $RUNNING_SERVICES; do
    echo -n "Stopping $SERVICE. "
    fleetctl stop $SERVICE
done

echo "Done."

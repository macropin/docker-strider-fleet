FROM macropin/strider:latest

MAINTAINER Andrew Cutler <andrew@panubo.io> 

ENV FLEET_VERSION v0.10.1

RUN cd /tmp && \
    wget https://github.com/coreos/fleet/releases/download/${FLEET_VERSION}/fleet-${FLEET_VERSION}-linux-amd64.tar.gz && \
    tar -v --wildcards -z --extract --file=fleet-v0.10.1-linux-amd64.tar.gz */fleetctl && \
    mv /tmp/fleet*/fleetctl /usr/local/bin/ && \
    rm -rf /tmp/*

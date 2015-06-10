FROM macropin/strider:latest

MAINTAINER Andrew Cutler <andrew@panubo.io> 

ENV FLEET_VERSION=v0.10.1
ENV PATH /data/bin:$PATH

RUN cd /tmp && \
    wget https://github.com/coreos/fleet/releases/download/${FLEET_VERSION}/fleet-${FLEET_VERSION}-linux-amd64.tar.gz && \
    tar -v --wildcards -z --extract --file=fleet-v0.10.1-linux-amd64.tar.gz */fleetctl && \
    mkdir -p /data/bin/ && \
    mv /tmp/fleet*/fleetctl /data/bin/ && \
    rm -rf /tmp/*

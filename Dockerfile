FROM macropin/strider:latest

MAINTAINER Andrew Cutler <andrew@panubo.io> 

ENV FLEET_VERSION v0.10.1
ENV ETCD_VERSION v2.0.12

USER root

RUN cd /tmp && \
    wget https://github.com/coreos/fleet/releases/download/${FLEET_VERSION}/fleet-${FLEET_VERSION}-linux-amd64.tar.gz && \
    tar -v --wildcards -z --extract --file=fleet-${FLEET_VERSION}-linux-amd64.tar.gz */fleetctl && \
    mv /tmp/fleet*/fleetctl /usr/local/bin/ && \
    wget https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz && \
    tar -v --wildcards -z --extract --file=etcd-${ETCD_VERSION}-linux-amd64.tar.gz */etcdctl && \
    mv /tmp/etcd-*/etcdctl /usr/local/bin && \
    rm -rf /tmp/*

USER strider

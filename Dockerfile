FROM macropin/strider:latest

MAINTAINER Andrew Cutler <andrew@panubo.io> 

ENV DOCKER_VERSION=1.6.2 VENV_ROOT=/usr/local FLEET_VERSION=v0.11.5 ETCD_VERSION=v2.0.12

USER root

# Install strider.sh
RUN curl --silent https://raw.githubusercontent.com/panubo/strider-deploy/master/strider.sh > /usr/local/bin/strider.sh && \
    chmod +x /usr/local/bin/strider.sh && \
    # Install Docker binary
    curl --silent https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION} > /usr/local/bin/docker && \
    chmod +x /usr/local/bin/docker && \
    # Install Python apps globally rather than into virtualenv
    apt-get update && apt-get install -y python-dev python-pip && \
    pip install --upgrade git+https://github.com/panubo/fleet-deploy.git#egg=fleet-deploy  && \
    pip install --upgrade git+https://github.com/panubo/fleet-deploy-atomic#egg=fleet-deploy-atomic && \
    pip install --upgrade git+https://github.com/panubo/docker-templater.git#egg=templater && \
    pip install --upgrade j2cli && \
    # Install Fleet
    cd /tmp && \
    wget -nv https://github.com/coreos/fleet/releases/download/${FLEET_VERSION}/fleet-${FLEET_VERSION}-linux-amd64.tar.gz && \
    tar -v --wildcards -z --extract --file=fleet-${FLEET_VERSION}-linux-amd64.tar.gz */fleetctl && \
    install /tmp/fleet*/fleetctl /usr/local/bin/ && \
    wget -nv https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz && \
    tar -v --wildcards -z --extract --file=etcd-${ETCD_VERSION}-linux-amd64.tar.gz */etcdctl && \
    install /tmp/etcd-*/etcdctl /usr/local/bin/ && \
    # Install some tools
    apt-get update && apt-get install -y vim rsync sudo && \
    echo "strider ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    # Cleanup
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

USER strider
RUN mkdir -p /tmp/strider/cache /tmp/strider/data /tmp/strider/git
COPY pre-entry.sh /
ENTRYPOINT ["/pre-entry.sh"]
CMD ["strider"]

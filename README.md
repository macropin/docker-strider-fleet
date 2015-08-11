# Strider-CD for Docker w/ Fleet

[![Docker Repository on Quay.io](https://quay.io/repository/macropin/strider-fleet/status "Docker Repository on Quay.io")](https://quay.io/repository/macropin/strider-fleet)
[![](https://badge.imagelayers.io/macropin/strider:latest.svg)](https://imagelayers.io/?images=macropin/strider:latest)

This bakes in `fleetctl`, `etcdctl`, `vim`, `rsync` and `sudo`.

It also makes `.strider` ephemeral and links it to `/tmp/strider`.

This allows you to deploy to your fleet cluster from Strider.

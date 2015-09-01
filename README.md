# Strider-CD for Docker w/ Fleet

[![Docker Repository on Quay.io](https://quay.io/repository/macropin/strider-fleet/status "Docker Repository on Quay.io")](https://quay.io/repository/macropin/strider-fleet)
[![](https://badge.imagelayers.io/macropin/strider:latest.svg)](https://imagelayers.io/?images=macropin/strider:latest)

This bakes in `docker`, `fleetctl`, `etcdctl`, `vim`, `rsync`, `sudo` and some Panubo tools

It also makes `.strider` ephemeral and links it to `/tmp/strider`.

This allows you to deploy to your fleet cluster from Strider and do other wonderful things.


## Building

Update build flag

```
sed -i -e "s@BUILD=[0-9]*@BUILD=$(date +%Y%m%d00)@g" Dockerfile
```

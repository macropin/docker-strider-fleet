# Strider-CD for Docker w/ Extras

This bakes in `docker`, `fleetctl`, `etcdctl`, `vim`, `rsync`, `sudo` and some [Panubo](https://panubo.io) tools.

It also makes `.strider` ephemeral and links it to `/tmp/strider`.

This allows you to deploy to your fleet cluster from Strider and do other wonderful things.

## Usage Example

A full example that links in the Docker socket, Fleet socket and etcd environment:

```
docker run --rm --name %n -v /var/run/docker.sock:/var/run/docker.sock -v /var/run/fleet.sock:/var/run/fleet.sock -v /mnt/data00/%n/data:/data -v /mnt/data00/git/:/tmp/strider/git -v /mnt/data00/fleet_units:/data/units --env-file /mnt/data00/%n/environment docker.io/panubo/strider-extra
```

## Building

To update the build flag and build without caching issues:

```
sed -i -e "s@BUILD=[0-9]*@BUILD=$(date +%Y%m%d00)@g" Dockerfile
```

## Status

Deprecated. We no longer use this.

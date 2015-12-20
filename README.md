Build ipxe on Docker
=================

Build [ipxe](http://ipxe.org) in a [Docker](http://docker.io) VM. Supports [Docker Machine](https://docs.docker.com/machine/).

TL;DR
=====

0) Only for Docker Machine builds: Edit `docker-compose.yml` and modify the mount points in `build-on-docker-machine.columes`.
1) Edit `build-options.env` 
2) run `./build_ipxe.sh`

Usage
======

### Configure

Configuration is done in `build-options.env`.

* `MAKE_TARGET` : What to build, e.g. `bin/undionly.kpxe`
* `OPTIONS` : Options passed to make, e.g. `EMBED=/config/from_http_server.ipxe`
* `DEBUG_OPTIONS` : Debug options, e.g. `DEBUG=http` 

### Docker Machine

The mountpoints on Docker Machine (e.g. Mac OS) are hardcoded in `docker-compose.yml`:

```yaml
# ...
build-on-docker-machine: 
    extends:
      service: build
    volumes: 
        - /mnt/hgfs/Users/jens/Documents/projects/admin/pxe/out:/out:rw
        - /mnt/hgfs/Users/jens/Documents/projects/admin/pxe/config:/config:ro
```

### Mapped directories

* `./input` : Configuration files used inside the vm, e.g. the embedded script.
* `./out` : Where the `MAKE_TARGET` is copied to after build.

### Build

``` 
./build_ipxe.sh
# ...
# output can be found in the local out folder
```

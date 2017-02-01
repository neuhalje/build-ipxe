Build ipxe on Docker
=================

Build [ipxe](http://ipxe.org) in a [Docker](http://docker.io) VM. Supports [Docker Machine](https://docs.docker.com/machine/).

TL;DR
=====

1. Edit `.env` to configure e.g. the path to the embedded script
2. (optionaly) Edit or copy the embedded script `config/from_http_server.ipxe`
3. run `./build_ipxe.sh`

Usage
======

### Configure

Configuration is done in [`.env`](./.env).

* `MAKE_TARGET` : What to build, e.g. `bin/undionly.kpxe`
* `OPTIONS` : Options passed to make, e.g. `EMBED=/config/from_http_server.ipxe`
* `DEBUG_OPTIONS` : Debug options, e.g. `DEBUG=http` 

### Docker Machine

The mountpoints on Docker Machine (e.g. Mac OS) are hardcoded to use `hgfs` (VMWARE Fusion). Pull requests for e.g. [VirtualBox](https://www.virtualbox.org) or [Joyent Triton](https://apidocs.joyent.com/docker/) are weclome.

```yaml
# ...

build-on-docker-machine-fusion: 
    extends:
      service: build
    volumes: 
        - /mnt/hgfs/${PWD}/out:/out:rw
        - /mnt/hgfs/${PWD}/config:/config:ro
```

### Mapped directories

* `./input` : Configuration files used inside the vm, e.g. the embedded script. Mapped to `/input`.
* `./out` : Where the `MAKE_TARGET` is copied to after build. Mapped to `/out`.

### Build

``` 
./build_ipxe.sh

Building build-on-docker-machine-fusion...
Step 0 : FROM ubuntu:15.04
 ---> 565cf6106ea7
Step 1 : MAINTAINER Jens Neuhalfen <Jens@neuhalfen.name>
 ---> Using cache
 ---> 6174b09280a7
# ...
  [BUILD] bin/davicom.ids.o
  [BUILD] bin/3c509.ids.o
  [BUILD] bin/igbvf_main.ids.o
# ...

################################## build complete
##
## Build output can be found in ./out
##
## ./out/undionly.kpxe
##

```

CONTRIBUTING
=============

Pull requests are welcome.

LICENSE
==========

[WTFPL](http://www.wtfpl.net/about/)


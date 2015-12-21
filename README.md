Build ipxe on Docker
=================

Build [ipxe](http://ipxe.org) in a [Docker](http://docker.io) VM. Supports [Docker Machine](https://docs.docker.com/machine/).

TL;DR
=====

1. Edit `build-options.env` to configure e.g. the path to the embedded script
2. (optionaly) Edit or copy the embedded script `config/from_http_server.ipxe`
3. run `./build_ipxe.sh`

Usage
======

### Configure

Configuration is done in `build-options.env`.

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
# ...
# output can be found in the local out folder
```

CONTRIBUTING
=============

Pull requests are welcome.

LICENSE
==========

[WTFPL](http://www.wtfpl.net/about/)


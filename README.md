# cwebp

A [Docker](http://docker.com) file to call [cwebp](https://developers.google.com/speed/webp/docs/cwebp) and [other functions](https://developers.google.com/speed/webp/docs/using) from [libwebp](https://chromium.googlesource.com/webm/libwebp/) library.

> Be aware! You should read carefully the usage documentation of every tool!

## Details

| Website | GitHub | Docker Hub |
| --- | --- | --- |
| [Deft.Work my personal blog](https://deft.work) | [cwebp](https://github.com/elswork/cwebp) | [cwebp](https://hub.docker.com/r/elswork/cwebp "elswork/cwebp on Docker Hub") |

| Docker Pulls | Docker Stars | Size/Layers |
| --- | --- | --- |
| [![](https://img.shields.io/docker/pulls/elswork/cwebp.svg)](https://hub.docker.com/r/elswork/cwebp "cwebp on Docker Hub") | [![](https://img.shields.io/docker/stars/elswork/cwebp.svg)](https://hub.docker.com/r/elswork/cwebp "cwebp on Docker Hub") | [![](https://images.microbadger.com/badges/image/elswork/cwebp.svg)](https://microbadger.com/images/elswork/cwebp "cwebp on microbadger.com") |

## Compatible Architectures

This image has been builded using [buildx](https://docs.docker.com/buildx/working-with-buildx/) for this architectures: 
- amd64 arm64 ppc64le s390x 386 arm/v7 arm/v6

## Usage Example

### Open ash in container

```bash
docker run -it --rm -v /path-to-folder:/data --entrypoint "/bin/ash" elswork/cwebp 
```
or
```bash
make console
```
p.e. I've included some .png and .jpg files for testing purposes in "data" folder:
```bash
make console DIR="$$(pwd)/data"
```
- You can set your local folder (DIR) that will be mounted in container, p.e. "/home/user/pictures"
---
### Start a custom command in container

```bash
docker run -it --rm -v /path-to-folder:/data elswork/cwebp cwebp -lossless deftwork.png -o deftwork.webp
```
or
```bash
make custom
```
p.e. I've included some .png and .jpg files for testing purposes in "data" folder:
```bash
make custom DIR="$$(pwd)/data" PARAM="cwebp -lossless deftwork.png -o deftwork.webp"
```

- You can use change the command in (PARAM) dwebp, gif2webp, ... instead of cwebp.
---
### Start a container command

```bash
docker run -it --rm -v /path-to-folder:/data elswork/cwebp cwebp -lossless deftwork.png -o deftwork.webp
```
or
```bash
make start
```
p.e. I've included some .png and .jpg files for testing purposes in "data" folder:
```bash
make start DIR="$$(pwd)/data" OPT="-lossless" FILE="deftwork" EXT="png"
```

- You can change options (OPT) with "-q 70", "-sns 70 -f 50 -size 60000", ... "-lossless" (default).
- You must set extension (EXT) forn "jpg", "tiff", ... for other extensions than "png" (default).
---
### Convert all .png from folder and subfolders recursively

```bash
docker run -it --rm -v /path-to-folder:/data elswork/cwebp \
find ./ -type f -name '*.png' -exec sh -c 'cwebp -lossless $1 -o "${1%.png}.webp"' _ {} \;
```
or
```bash
make bulk
```
p.e. I've included some .png and .jpg files for testing purposes in "data" folder:
```bash
make bulk DIR="$$(pwd)/data" OPT="-lossless" EXT="png"
```
- Same parameters than previous operation.
---
### Convert all .png concurrently

This is faster than previous operation because it raise concurrent threads.

```bash
docker run -it --rm -v /path-to-folder:/data elswork/cwebp \
find ./ -type f -name '*.png' | xargs -P 8 -I {} sh -c 'cwebp -lossless $1 -o "${1%.png}.webp"' _ {} \;
```
or
```bash
make concurrent
```
p.e. I've included some .png and .jpg files for testing purposes in "data" folder:
```bash
make concurrent DIR="$$(pwd)/data" OPT="-lossless" EXT="png"
```
- Same parameters than previous operation.
- The number of concurrent threads is 8.
---
**[Sponsor me!](https://github.com/sponsors/elswork) Together we will be unstoppable.**
# cwebp

A [Docker](http://docker.com) file to build [cwebp](https://developers.google.com/speed/webp/docs/cwebp) and other functions from [libwebp](https://chromium.googlesource.com/webm/libwebp/) library.

> Be aware! You should read carefully the usage documentation of every tool!

## Details

| Website | GitHub | Docker Hub |
| --- | --- | --- |
| [Deft.Work my personal blog](https://deft.work) | [GitHub](https://github.com/elswork/cwebp) | [cwebp](https://hub.docker.com/r/elswork/cwebp "elswork/cwebp on Docker Hub") |

| Docker Pulls | Docker Stars | Size/Layers |
| --- | --- | --- |
| [![](https://img.shields.io/docker/pulls/elswork/cwebp.svg)](https://hub.docker.com/r/elswork/cwebp "cwebp on Docker Hub") | [![](https://img.shields.io/docker/stars/elswork/cwebp.svg)](https://hub.docker.com/r/elswork/cwebp "cwebp on Docker Hub") | [![](https://images.microbadger.com/badges/image/elswork/cwebp.svg)](https://microbadger.com/images/elswork/cwebp "cwebp on microbadger.com") |

## Build Instructions
Build for amd64, armv7l or arm64 architecture (thanks to its [Multi-Arch](https://blog.docker.com/2017/11/multi-arch-all-the-things/) base image)

```bash
docker build -t elswork/cwebp .
```

## Usage Example

### Start container

```bash
docker run -it --rm -v /path-to-folder:/data \
 elswork/cwebp \
 find ./ -type f -name '*.png' -exec sh -c 'cwebp -lossless $1 -o "${1%.png}.webp"' _ {} \;
```
or
```bash
make bulk EXT="png" DIR="/path-to-folder"
```

**[Sponsor me!](https://github.com/sponsors/elswork) Together we will be unstoppable.**
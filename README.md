# websockets cat

This is a Docker image for [wscat], the websockets cat. Use it as in the example
below:

```shell
docker run -it --rm --net=host yanzinetworks/wscat
```

Read more at the [wscat] repository site for more details about the command-line
arguments.

  [wscat]: https://github.com/websockets/wscat

## Building

This image can be used to build other versions of [wscat] by setting the
`VERSION` build argument, e.g. by running a command similar to the following
from the directory hosting this repository.

```shell
docker build -t yanzinetworks/wscat:2.2.0 --build-arg VERSION=2.2.0 .
```

## Implementation Details

Internally, the image installs [wscat] using `npm`. It uses a separate user
called `wscat` with ids: `7532:7532`.

## Release Tempo

The intention for this repository is to follow the [release] tempo for the
official [wscat] project. The project will typically pick the latest stable
[node] Alpine image at release time. Generated images are automatically
[tagged][tags] with the same version number as the [wscat] [release] number.

Missing a release? Open a [PR]!

Releases will be done through creating (git) tags with the same value as the one
in the `VERSION` build argument of the [Dockerfile]

  [release]: https://github.com/websockets/wscat/releases/
  [node]: https://hub.docker.com/_/node
  [tags]: https://hub.docker.com/r/yanzinetworks/wscat/tags
  [PR]: https://github.com/YanziNetworks/wscat/pulls
  [Dockerfile]: ./Dockerfile

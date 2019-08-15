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

FROM node:13.10.1-alpine3.11
LABEL maintainer="efrecon@gmail.com"

ARG VERSION=4.0.0
ARG BUILD_DATE

# Create user
ENV USER=wscat
ENV UID=7532
ENV GID=7532
RUN addgroup --gid "$GID" "$USER" && \
    adduser \
        --disabled-password \
        --gecos "" \
        --ingroup "$USER" \
        --uid "$UID" \
        "$USER"

RUN npm install -g wscat@${VERSION}

USER ${USER}
ENTRYPOINT [ "wscat" ]

# OCI Annotation: https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="wscat"
LABEL org.opencontainers.image.description="WebSocket cat"
LABEL org.opencontainers.image.authors="Emmanuel Frecon <efrecon+github@gmail.com>"
LABEL org.opencontainers.image.url="https://github.com/YanziNetworks/wscat"
LABEL org.opencontainers.image.documentation="https://github.com/YanziNetworks/wscat/README.md"
LABEL org.opencontainers.image.source="https://github.com/YanziNetworks/wscat"
LABEL org.opencontainers.image.version="$VERSION"
LABEL org.opencontainers.image.created="$BUILD_DATE"
LABEL org.opencontainers.image.vendor="Yanzi Networks AB"
LABEL org.opencontainers.image.licenses="MIT"

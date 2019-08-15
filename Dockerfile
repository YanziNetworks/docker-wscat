FROM node:12.8.0-slim
LABEL maintainer="efrecon@gmail.com"

ARG VERSION=2.2.1
ARG BUILD_DATE
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="yanzinetworks/wscat"
LABEL org.label-schema.description="WebSocket cat"
LABEL org.label-schema.url="https://github.com/websockets/wscat"
LABEL org.label-schema.docker.cmd="docker run --rm -it --net=host yanzinetworks/wscat"

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
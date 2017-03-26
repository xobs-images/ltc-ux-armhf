FROM armhfbuild/nginx:1.11.9

MAINTAINER Sean Cross <xobs@kosagi.com>

RUN \
    apt-get update && \
    apt-get install -y \
        curl unzip \
    && \
    curl -sSL -o /build.zip https://github.com/xobs/codebender-test-shell/archive/master.zip && \
    mkdir /build && \
    cd /build && \
    unzip -q /build.zip && \
    rm -f /build.zip && \
    cd * && \
    rm -rf /usr/share/nginx/* && \
    mv html /usr/share/nginx/ && \
    cd / && \
    rm -rf /build && \
    true

COPY nginx.conf /etc/nginx/conf.d/default.conf

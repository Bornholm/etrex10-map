FROM alpine:3.14

ARG USER=etrex
ARG GROUP=etrex

RUN apk add --no-cache curl openjdk11-jre-headless unzip

RUN addgroup -g 1000 ${USER} && \
    adduser -u 1000 -G ${GROUP} -h /home/${USER} -s /bin/sh -D ${USER}

RUN curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.5/fixuid-0.5-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid

COPY fixuid.yml /etc/fixuid/config.yml

COPY bin/ /usr/local/bin/

RUN mkdir -p /opt/mkgmap \
    && curl --output mkgmap.zip https://www.mkgmap.org.uk/download/mkgmap-r4806.zip \
    && unzip -d /opt/mkgmap mkgmap.zip \
    && rm -f mkgmap.zip

RUN mkdir -p /opt/etrex10-map \
    && curl --output /opt/etrex10-map/style10.zip http://gps.maroufi.net/download/mystyle10.zip \
    && curl --output /opt/etrex10-map/e10.txt http://gps.maroufi.net/download/e10.TXT

WORKDIR /home/${USER}

USER ${USER}:${GROUP}
ENTRYPOINT ["fixuid"]
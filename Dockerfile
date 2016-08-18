# vim:set ft=dockerfile:
FROM alpine:edge

# add community and testing repo
RUN echo "@community http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    mkdir /var/log/supervisor

# install the packges we need
RUN apk add --no-cache bash bitcoin@testing bitcoin-cli@testing shadow supervisor tor

ADD supervisord.conf /etc/

EXPOSE 8332 8333
WORKDIR /var/log/supervisor
CMD ["/usr/bin/supervisord"]

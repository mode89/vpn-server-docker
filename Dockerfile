from ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y \
        easy-rsa \
        openvpn

RUN apt-get install -y htop vim

ENV OPENVPN_CA_DIR /openvpn-ca
RUN make-cadir ${OPENVPN_CA_DIR:?}

COPY container/configure-openvpn-server /usr/local/bin/
COPY container/server.conf /etc/openvpn/server/config

from ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y \
        easy-rsa \
        openvpn

RUN apt-get install -y htop vim

ENV OPENVPN_DIR /srv/openvpn
ENV OPENVPN_CA_DIR ${OPENVPN_DIR}/ca

COPY container/configure-openvpn-server /usr/local/bin/
COPY container/server.conf ${OPENVPN_DIR}/

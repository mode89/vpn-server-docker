from ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y \
        easy-rsa \
        openvpn

RUN apt-get install -y htop vim

ENV OPENVPN_DIR /srv/openvpn
ENV OPENVPN_CA_DIR ${OPENVPN_DIR}/ca

COPY scripts/configure-openvpn-server /usr/local/bin/
COPY scripts/configure-openvpn-client /usr/local/bin/

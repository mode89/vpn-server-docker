from ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y \
        easy-rsa \
        openvpn

RUN make-cadir /openvpn-ca && \
    cd /openvpn-ca && \
    sed -i "s/\(^export KEY_COUNTRY=\)\".*\"/\1\"US\"/" vars && \
    sed -i "s/\(^export KEY_PROVINCE=\)\".*\"/\1\"MyProvince\"/" vars && \
    sed -i "s/\(^export KEY_CITY=\)\".*\"/\1\"MyCity\"/" vars && \
    sed -i "s/\(^export KEY_ORG=\)\".*\"/\1\"MyOrganization\"/" vars && \
    sed -i "s/\(^export KEY_EMAIL=\)\".*\"/\1\"my@mail.com\"/" vars && \
    sed -i "s/\(^export KEY_OU=\)\".*\"/\1\"MyUnit\"/" vars && \
    sed -i "s/\(^export KEY_NAME=\)\".*\"/\1\"MyServer\"/" vars && \
    cp openssl-1.0.0.cnf openssl.cnf && \
    bash -c "source vars && \
        ./clean-all && \
        ./build-ca --batch"

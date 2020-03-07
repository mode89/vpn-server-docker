This repository provides a docker image wrapping OpenVPN server.

## Prerequisites

* Docker

## Usage

First, build the docker image and configure the OpenVPN server:
* run the [```vpn-configure-server```](scripts/vpn-configure-server) script. It will build the image and initialize
  the certificate storage.
* The ```/srv/openvpn``` directory of the host filesystem keeps the server configurtion
  files and it is mounted inside the container. The ```server.conf``` file is the
  [OpenVPN server configuration file](https://help.ubuntu.com/lts/serverguide/openvpn.html#openvpn-simple-server-configuration).
  The ```client.ovpn.base``` file is a template used for generation
  of the [OpenVPN client configuration files](https://help.ubuntu.com/lts/serverguide/openvpn.html#openvpn-simple-client-configuration). Modify these files to fit your requirements.
  Please see OpenVPN's documentation for more details.

To launch the server, run the [```vpn-run-server```](scripts/vpn-run-server) script.
To stop the server, stop the docker container.

The [```vpn-server.service```](systemd/vpn-server.service) script can be used
to manage the server with ```systemd```.

To generate a configuration file for a new client, run
the [```vpn-configure-client```](scripts/vpn-configure-client) script
with a single argument specifying the client identification name. This will
generate a certificate and create a ```<client-identification-name>.ovpn``` file
inside the ```/srv/openvpn/client-config``` directory. Copy this file and pass it
to the OpenVPN client.

## Contributing

If you'd like to improve the project, please make a pull request.

## License

MIT

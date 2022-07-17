# Centauri Edge

Centauri Edge is a hardware device that can be deployed in locations with limited access to the internet. Centauri Edge nodes run a set of programs as Docker containers which are exposed to local clients through the onboard WiFi network. While Edge nodes may have a backhaul connection over the WAN, the only route exposed to WiFi clients is the router interface itself, on which a NGINX container is used to route to various different onboard services.

Clients can connect to Centauri Edge nodes to access the local Centauri network and any services on top of this network. As all edge nodes deployed in a network are connected over the same Centauri network, data submitted on one peer will be available on all other peers, even if they are not directly connected or have WAN access.

## Core Services

- `dnsmasq`: DHCP server for WiFi clients
- `hostapd`: WiFi access point
- `resolved`: DNS config manager for edge node
- `CoreDNS`: DNS server for local services
- `nginx`: HTTP reverse proxy for serving local services

## Edge Services

- `centaurid`: Centauri peer node
- `centauri-docs`: Documentation server for Centauri
- `shdw`: shdw.tech chat service

## Usage

Create `services/centaurid/centauri.yaml` with the respective configuration for your network.

Import SSL cert(s) to `services/nginx/certs`.
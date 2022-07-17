#!/bin/bash

install_docker() {
    apt-get update -y && \
        apt-get install -y \
            ca-certificates \
            curl \
            gnupg \
            lsb-release && \
        mkdir -p /etc/apt/keyrings && \
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor --batch --yes -o /etc/apt/keyrings/docker.gpg && \
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
        apt-get update -y && \
        apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

install_dnsmasq() {
    apt-get update -y && \
        apt-get install -y dnsmasq
}

disable_systemd_resolved() {
    systemctl disable --now systemd-resolved
}

install_resolvconf() {
    apt-get update -y && \
        apt-get install -y resolvconf
}

install_hostapd() {
    apt-get update -y && \
        apt-get install -y hostapd
}

enable_hostapd() {
    systemctl enable --now hostapd
}

enable_dnsmasq() {
    systemctl enable --now dnsmasq
}

main() {
    install_docker
    install_dnsmasq
    disable_systemd_resolved
    install_resolvconf
    install_hostapd
    enable_hostapd
    enable_dnsmasq
}
main "$@"
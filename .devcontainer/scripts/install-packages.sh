#!/usr/bin/env bash

UID=${PUID:-1000}

pacman -Syu git docker docker-compose --noconfirm

chown "$UID" /var/run/docker.sock
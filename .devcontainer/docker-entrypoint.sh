#!/usr/bin/env bash

sudo pacman -Syu git --noconfirm

exec "$@"
FROM ghcr.io/linuxserver/baseimage-kasmvnc:arch as arch

RUN pacman -Syu --noconfirm

RUN pacman -Sy git --noconfirm

COPY scripts/ /

RUN chmod +x /setup_container.sh /clone-repo.sh

ENTRYPOINT [ "/init" ]

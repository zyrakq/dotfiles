FROM linuxserver/webtop:arch-kde as arch-kde

RUN pacman -Syu --noconfirm

RUN pacman -Sy git --noconfirm

COPY scripts/ /

RUN chmod +x /setup_container.sh /clone-repo.sh

ENTRYPOINT [ "/init" ]

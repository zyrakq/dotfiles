FROM linuxserver/webtop:arch-kde as arch-kde

RUN pacman -Syu --noconfirm

COPY scripts/install-packages.sh /

RUN chmod +x /install-packages.sh && /install-packages.sh

COPY scripts/clone-repo.sh /

RUN chmod +x /clone-repo.sh

ENTRYPOINT [ "/init" ]
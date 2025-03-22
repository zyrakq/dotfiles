FROM linuxserver/webtop:arch-kde as arch-kde

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh && /docker-entrypoint.sh

COPY clone-repo.sh /

ENTRYPOINT [ "/init" ]
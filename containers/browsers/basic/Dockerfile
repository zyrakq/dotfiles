FROM linuxserver/ungoogled-chromium:latest as chromium

# RUN pacman -Syu --noconfirm

# RUN pacman -S nano --noconfirm

COPY policy.json etc/chromium/policies/managed/policy.json

COPY chromium-flags.conf /etc/

COPY chromium-flags.conf /etc/chromium/

COPY chromium-flags.conf /config/.config/

COPY chromium-flags.conf /config/.config/chromium/

ENV FILE_NAME="master_preferences"

COPY "${FILE_NAME}" /usr/share/chromium/

COPY "${FILE_NAME}" /etc/chromium/

COPY "${FILE_NAME}" /etc/chromium/policies/managed/

COPY "${FILE_NAME}" /config/.config/chromium/

COPY "${FILE_NAME}" /config/.config/chromium/Default/

ENV FILE_NAME="initial_preferences"

COPY "${FILE_NAME}" /usr/share/chromium/

COPY "${FILE_NAME}" /etc/chromium/

COPY "${FILE_NAME}" /etc/chromium/policies/managed/

COPY "${FILE_NAME}" /config/.config/chromium/

COPY "${FILE_NAME}" /config/.config/chromium/Default/

ENTRYPOINT [ "/init" ]

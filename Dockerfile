FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8

RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      fluxbox \
      novnc \
      supervisor \
      tigervnc-common \
      tigervnc-standalone-server \
      xterm \
      expect

RUN ln -s /usr/share/novnc/vnc_lite.html /usr/share/novnc/index.html

ENV HOME=/root \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768

COPY . /vnc
ENTRYPOINT ["/vnc/entrypoint.tcl"]
EXPOSE 8080

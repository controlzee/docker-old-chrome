FROM --platform="linux/amd64" ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive \
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US.UTF-8 \
  LC_ALL=C.UTF-8

# stuff for novnc setup
RUN set -ex; \
  apt-get update; \
  apt-get install -y \
    fluxbox \
    novnc \
    supervisor \
    tightvncserver \
    xterm \
    expect \
    git \
    sudo

# there's no index.html in the folder by default
RUN cd /usr/share/novnc && \
  ln -s vnc_auto.html index.html

# chrome dependencies (and unzip for unzipping chrome-linux.zip)
RUN apt-get install -y \
  unzip \
  libpangocairo-1.0-0 \
  libnss3 \
  cups \
  libgconf-2-4 \
  libatk1.0-0 \
  libasound2 \
  libgtk2.0-0

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USERNAME=user

# create normal user to run stuff as
RUN groupadd -g $GROUP_ID $USERNAME && \
  useradd --home /home/$USERNAME --shell /bin/bash -u $USER_ID -g $GROUP_ID $USERNAME && \
  mkdir -p /home/$USERNAME && chown -R ${USER_ID}:${GROUP_ID} /home/$USERNAME

# give user passwordless sudo just in case
RUN groupadd wheel && \
  usermod -a -G wheel $USERNAME && \
  echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY . /vnc

USER $USERNAME

WORKDIR /home/$USERNAME

RUN unzip /vnc/chrome-linux.zip -d /home/$USERNAME/

ENV HOME=/home/$USERNAME \
  DISPLAY=:0.0 \
  DISPLAY_WIDTH=1024 \
  DISPLAY_HEIGHT=768

ENTRYPOINT ["/vnc/entrypoint.tcl"]
EXPOSE 8080

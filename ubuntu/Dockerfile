FROM ubuntu:xenial

RUN apt-get update; apt-get clean

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install x11vnc.
RUN apt-get install -y x11vnc

# Install xvfb.
RUN apt-get install -y xvfb

# Install fluxbox.
RUN apt-get install -y fluxbox

# Install wget.
RUN apt-get install -y wget

# Install wmctrl.
RUN apt-get install -y wmctrl

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome.
RUN apt-get update && apt-get -y install google-chrome-stable

RUN apt-get install -y software-properties-common

RUN apt-get install -y sudo && \
    echo "apps ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/apps && \
    chmod 0440 /etc/sudoers.d/apps

#install useful packages
RUN apt-get install -y psmisc net-tools mc htop

#install wine
RUN apt-get install -y wine wine-development q4wine winetricks playonlinux

#fix locales
RUN mkdir /var/lib/locales && \
    mkdir /var/lib/locales/supported.d && \
    mkdir /var/lib/locales/supported.d/ru && \
    echo "ru_RU.CP1251 CP1251" > /var/lib/locales/supported.d/ru && \
    apt-get install -y locales && \
    locale-gen

COPY bootstrap.sh /

CMD '/bootstrap.sh'
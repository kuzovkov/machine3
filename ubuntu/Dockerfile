FROM ubuntu:xenial

RUN apt-get update && \
    apt-get install -y x11vnc xvfb fluxbox wget wmctrl software-properties-common \
    psmisc net-tools mc htop

RUN apt-get install -y sudo && \
    echo "apps ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/apps && \
    chmod 0440 /etc/sudoers.d/apps

#fix locales
RUN mkdir /var/lib/locales && \
    mkdir /var/lib/locales/supported.d && \
    touch /var/lib/locales/supported.d/ru && \
    echo "ru_RU.CP1251 CP1251" > /var/lib/locales/supported.d/ru && \
    apt-get install -y locales && \
    locale-gen

RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
RUN pip install redis psycopg2-binary datetime
RUN pip install terminaltables daemonize

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome.
RUN apt-get update && apt-get -y install google-chrome-stable

RUN apt-get install -y aptitude
RUN aptitude install -y wine wine wine-development q4wine winetricks playonlinux
# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps
COPY bootstrap.sh /

CMD '/bootstrap.sh'
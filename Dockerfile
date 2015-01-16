FROM randomparity/docker-supervisor:latest

MAINTAINER David Christensen <randomparity@gmail.com>

ENV LAST_UPDATE_HEADPHONES 2015-01-15

# Install prerequisites and clone the SickBeard repository
RUN apt-get -qy install git python-openssl && \
    mkdir /opt/headphones && \
    git clone https://github.com/rembo10/headphones.git /opt/headphones && \
    chown -R sysadmin:sysadmin /opt/headphones

# We've got everything we need so clear out the apt data
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/tmp/* && \
    rm -rf /tmp/*

VOLUME ["/config", "/download", "/media"]

EXPOSE 8181

# Copy the supervisord configuration files into the container
COPY headphones.conf /etc/supervisor/conf.d/headphones.conf

# No need to setup a CMD directive since that was handled in the FROM container.

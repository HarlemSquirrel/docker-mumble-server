FROM phusion/baseimage

MAINTAINER David Coppit <david@coppit.org>

RUN apt-add-repository ppa:mumble/release && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mumble-server sudo

ENV USERNAME mumble-server

# Add the start script
ADD start.sh /tmp/start.sh
RUN chmod 755 /tmp/start.sh

VOLUME /data

EXPOSE 64738

CMD ["/tmp/start.sh"]

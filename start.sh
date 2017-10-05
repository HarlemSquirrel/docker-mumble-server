#!/bin/bash

if [ ! -f /data/mumble-server.ini ]
then
  cp /etc/mumble-server.ini /data/
  sed -i 's/var.log.mumble-server/data/' /data/mumble-server.ini
  sed -i 's/var.lib.mumble-server/data/' /data/mumble-server.ini
  chmod -R a+rw /data
  echo Created /data/mumble-server.ini. Exiting.
  exit 1
fi

echo Starting mumble-server service
sed -i 's/^INIFILE=.*/INIFILE=\/data\/mumble-server.ini/' /etc/init.d/mumble-server
service mumble-server start

while true
do
  sleep 3600
done

#!/bin/bash

# shut down all ezarr containers referenced by docker-compose.yml 
sudo docker compose down

# Remove old users and group
sudo userdel sonarr
sudo userdel radarr
sudo userdel lidarr
sudo userdel readarr
sudo userdel bazarr
sudo userdel prowlarr
sudo userdel jackett
sudo userdel jellyseerr
sudo userdel qbittorrent
sudo userdel whisparr
sudo groupdel mediacenter

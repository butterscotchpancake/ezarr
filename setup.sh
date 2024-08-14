#!/bin/bash

# Set up your .env file BEFORE running this script!!!
# export all variables from .env
set -a
source .env
set +a

# Make users and group
sudo useradd sonarr -u $SONARR_UID
sudo useradd radarr -u $RADARR_UID
sudo useradd lidarr -u $LIDARR_UID
sudo useradd readarr -u $READARR_UID
sudo useradd prowlarr -u $PROWLARR_UID
sudo useradd qbittorrent -u $QBITTORRENT_UID
sudo useradd jackett -u $JACKETT_UID
sudo useradd jellyseerr -u $JELLYSEERR_UID
sudo useradd bazarr -u $BAZARR_UID
sudo useradd whisparr -u $WHISPARR_UID
sudo groupadd mediacenter -g $MEDIACENTER_GID

# Adds current user to the mediacenter group.
sudo usermod -a -G mediacenter $USER

# adds all the service users to the group 
sudo usermod -a -G mediacenter sonarr
sudo usermod -a -G mediacenter radarr
sudo usermod -a -G mediacenter lidarr
sudo usermod -a -G mediacenter readarr
sudo usermod -a -G mediacenter prowlarr
sudo usermod -a -G mediacenter qbittorrent
sudo usermod -a -G mediacenter jackett
sudo usermod -a -G mediacenter jellyseerr
sudo usermod -a -G mediacenter bazarr
sudo usermod -a -G mediacenter whisparr

# Make directories
sudo mkdir -pv ${ROOT_DIR:-.}/config/{sonarr,radarr,lidarr,readarr,prowlarr,qbittorrent,jackett,whisparr,jellyseerr,bazarr}-config
sudo mkdir -pv ${ROOT_DIR:-.}/data/{torrents,media}/{tv,movies,music,books,xxx,other}

# Set permissions
sudo chmod -R 775 ${ROOT_DIR:-.}/data/
sudo chmod -R 775 ${ROOT_DIR:-.}/config/
sudo chown -R $UID:mediacenter ${ROOT_DIR:-.}/data/
sudo chown -R $UID:mediacenter ${ROOT_DIR:-.}/config/
sudo chown -R sonarr:mediacenter ${ROOT_DIR:-.}/config/sonarr-config
sudo chown -R radarr:mediacenter ${ROOT_DIR:-.}/config/radarr-config
sudo chown -R lidarr:mediacenter ${ROOT_DIR:-.}/config/lidarr-config
sudo chown -R readarr:mediacenter ${ROOT_DIR:-.}/config/readarr-config
sudo chown -R prowlarr:mediacenter ${ROOT_DIR:-.}/config/prowlarr-config
sudo chown -R qbittorrent:mediacenter ${ROOT_DIR:-.}/config/qbittorrent-config
sudo chown -R jackett:mediacenter ${ROOT_DIR:-.}/config/jackett-config
sudo chown -R jellyseerr:mediacenter ${ROOT_DIR:-.}/config/jellyseerr-config
sudo chown -R bazarr:mediacenter ${ROOT_DIR:-.}/config/bazarr-config
sudo chown -R whisparr:mediacenter ${ROOT_DIR:-.}/config/whisparr-config

echo "Done! It is recommended to reboot now."

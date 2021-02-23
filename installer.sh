#!/bin/bash -xe

git config --global credential.helper 'cache --timeout=604800'

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker $USER

sudo apt update && sudo apt install -y docker-compose htop

# set up docker compose alias
grep "alias dc=" ~/.bashrc || echo "alias dc='docker-compose'" >>~/.bashrc
grep "alias kick=" ~/.bashrc || echo "alias kick='git pull && dc down && dc up -d && dc logs -f'" >>~/.bashrc

# activates bashrc
. ~/.bashrc

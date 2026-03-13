#!/usr/bin/env sh
DEST="/home/rumi/repo/nixos"
USER_TO_OWN=${SUDO_USER:-root}

bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)

echo "${bold}${red}-> Remove old copy of DEST if exists${reset}"
set -x
if [ -d "$DEST" ]; then
  rm -rf "$DEST"
fi

set +x
echo "${bold}${red}-> Create copy of /etc/nixos to DEST${reset}"
set -x
cp -a /etc/nixos "$DEST"
chown -R "${USER_TO_OWN}:users" "$DEST"

set +x
echo "${bold}${red}-> Succesfully completed backup${reset}"

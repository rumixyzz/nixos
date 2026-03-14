#!/usr/bin/env zsh
if [ "$PWD" != "/etc/nixos" ]; then
        exit 1
fi

for x in $(find . -iname "*.nix"); do
        alejandra "$x"
done

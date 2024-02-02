#!/usr/bin/env bash

if ! scoop >/dev/null 2>&1; then
  echo "Scoop command not found, make sure Scoop is installed and in your PATH"
  exit 1
fi

echo "Updating Scoop..."
scoop update

echo "Scoop updated successfully."

# Declare the bucket details in an associative array
declare -A buckets

buckets["extras"]="https://github.com/ScoopInstaller/Extras"
buckets["games"]="https://github.com/Calinou/scoop-games"
buckets["main"]="https://github.com/ScoopInstaller/Main.git"
buckets["versions"]="https://github.com/ScoopInstaller/Versions"

# Loop over the associative array and add each bucket
for bucket in "${!buckets[@]}"; do
  echo "Adding bucket: $bucket"
  scoop bucket add "$bucket" "${buckets[$bucket]}"
done

echo "All buckets added successfully."

apps=(
  "7zip"
  "aria2"
  "curl"
  # "czkawka-gui"
  "fiddler"
  "gpg"
  "gpu-z"
  "hashcat"
  "hxd"
  "mpc-be"
  "musicbee"
  "onecommander"
  "qbittorrent"
  # "raindrop.io"
  "rufus"
  "ryujinx"
  "sharex"
  "spacesniffer"
  "ssd-z"
  "sniffnet"
  "sudo"
  # "sunshine"
  "sysinternals"
  "yuzu"
  "zeal"
)

for app in "${apps[@]}"; do
  echo "Installing app: $app"
  scoop install "$app"
  echo "Updating app: $app"
  scoop update "$app"
done

echo "All apps added and updated successfully."

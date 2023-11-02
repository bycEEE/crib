#!/usr/bin/env bash
set -e

script_path=$(readlink -f "$0")
script_dir=$(dirname "$script_path")

export EGET_CONFIG="$script_dir/.eget.toml"

windows_user=$(wslvar username)
bin_path="/mnt/c/Users/$windows_user/bin2"

check_existing_folder() {
    local app=$1
    if [ -d "$bin_path/$app" ]; then
        echo "Skipping $app, already installed"
        return 0
    fi
    return 1
}

app="dual-key-remap"
if ! check_existing_folder $app; then
    echo "Downloading $app"
    curl -s -L https://github.com/ililim/dual-key-remap/releases/download/v0.7/dual-key-remap-v0.7.zip -o /tmp/dual-key-remap.zip
    ouch decompress /tmp/dual-key-remap.zip --dir $bin_path/${app}
    rm -rf /tmp/dual-key-remap.zip
fi

app="dlss-swapper"
if ! check_existing_folder $app; then
    echo "Downloading $app"
    curl -s -L https://github.com/ililim/dual-key-remap/releases/download/v0.7/dual-key-remap-v0.7.zip -o /tmp/dual-key-remap.zip
    ouch decompress /tmp/dual-key-remap.zip --dir $bin_path/${app}
    rm -rf /tmp/dual-key-remap.zip
fi

# app="dlss-swapper"
# if ! check_existing_folder $app; then
#     eget beeradmoore/dlss-swapper --to "$bin_path/${app}"
#     echo "Successfully downloaded $app"
# fi

# app="dnSpy"
# if ! check_existing_folder $app; then
#     eget dnSpy/dnSpy --to "$bin_path/${app}"
#     echo "Successfully downloaded $app"
# fi

#!/usr/bin/env bash

if ! winget.exe > /dev/null 2>&1; then
    echo "winget.exe command not found, make sure winget is installed and in your PATH"
    exit 1
fi

apps=(
    # Security
    "AgileBits.1Password"
    "Malwarebytes.Malwarebytes"
    "PortSwigger.BurpSuite.Community"

    # Browsers
    "Google.Chrome"
    "Mozilla.Firefox"

    # General Applications
    "Spotify.Spotify"
    "Elgato.StreamDeck"
    "Kairos.DuetDisplay"
    "Logitech.GHUB"
    "Obsidian.Obsidian"

    # Development
    "chrisant996.Clink"
    "Docker.DockerDesktop"
    "Insomnia.Insomnia"
    # "Microsoft.DevHome"
    "Microsoft.WindowsTerminal"
    "Microsoft.WindowsTerminal.Preview"
    # "Nvidia.CUDA"
    "PostgreSQL.pgAdmin"
    "Python.Python.3.11"
    "wez.wezterm"

    # System Monitoring
    "CPUID.HWMonitor"
    "CrystalDewWorld.CrystalDiskMark"
    "Piriform.Speccy"

    # Gaming
    "FlawlessWidescreen.FlawlessWidescreen"
    "NexusMods.Vortex"
    "Nvidia.GeForceExperience"
    "Valve.Steam"

    # Messaging
    "Discord.Discord"
    "Facebook.Messenger"
    "SlackTechnologies.Slack"

    # Utilities
    "Guru3D.Afterburner"
    "LukaszSwiszcz.Winpinator"
    "Microsoft.PowerToys"
    "schollz.croc"
    "StartIsBack.StartAllBack"

    # Misc
    "Gyan.FFmpeg"
    "jstarks.npiperelay"
    "Microsoft.DotNet.DesktopRuntime.3_1"
    # "Microsoft.DotNet.DesktopRuntime.5"
    "Microsoft.DotNet.DesktopRuntime.6"
    "Microsoft.DotNet.DesktopRuntime.7"
    "Microsoft.dotNetFramework"
)

for app in "${apps[@]}"; do
    echo "Installing app: $app"
    winget.exe install --silent -e --id "$app" --no-upgrade --accept-source-agreements --accept-package-agreements
done

echo "All apps added and updated successfully."

winget.exe upgrade

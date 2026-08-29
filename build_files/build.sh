#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install LabWC + Noctalia

# --- LabWC (official Fedora repo) ---
dnf5 install -y labwc labwc-session

# --- Terra repo (needed for Noctalia on Fedora < 44 or if not in main repo) ---
dnf5 install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# --- Noctalia (from Terra repo) ---
dnf5 install -y noctalia-shell

# --- Optional dependencies / tools ---
dnf5 install -y \
    mako \
    xdg-desktop-portal-gnome \
    xdg-desktop-portal-gtk \
    xwayland-satellite \
    polkit-kde-agent \
    wlsunset \
    cava \
    playerctl \
    ddcutil \
    ghostty \
    zsh

# --- Remove bloat (optional) ---
dnf5 remove -y xwaylandvideobridge || true

dnf5 clean all
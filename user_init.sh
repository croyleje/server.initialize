#!/bin/bash --init-file
source=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# Manually install git and clone this repo to /root and run this script.

# getent passwd | \
# grep -vE '(nologin|false)$' | \
# awk -F: -v min=`awk '/^UID_MIN/ {print $2}' /etc/login.defs` \
# -v max=`awk '/^UID_MAX/ {print $2}' /etc/login.defs` \
# '{if(($3 >= min)&&($3 <= max)) print $1}' | \
# sort -u

cp -f "$source/.profile" "$HOME"
cp -f "$source/.bashrc" "$HOME"
cp -f "$source/.bash_logout" "$HOME"
cp "$source/.vimrc" "$HOME"

. ~/.profile
. ~/.bashrc

# Configure sudoers file.
# Defaults     !tty_tickets

# useradd -m -s /bin/bash <username> -G sudo
# usermod -aG sudo <username>

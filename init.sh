#!/bin/bash --init-file
source=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# Manually install git and clone this repo to /root and run this script.

# getent passwd | \
# grep -vE '(nologin|false)$' | \
# awk -F: -v min=`awk '/^UID_MIN/ {print $2}' /etc/login.defs` \
# -v max=`awk '/^UID_MAX/ {print $2}' /etc/login.defs` \
# '{if(($3 >= min)&&($3 <= max)) print $1}' | \
# sort -u

if [ "$EUID" -ne 0 ]
  then echo "ERROR: script must be run as root"
  exit 1
fi

sudo apt update && sudo apt upgrade -y

# sudo apt install docker docker-compose

sudo apt install gawk ca-certificates certbot syslog-ng syslog-ng-core \
	syslog-ng-scl fail2ban ripgrep bash-completion logrotate locate logwatch \
	apt-listchanges

cp -f "$source/.profile" "$HOME"
cp -f "$source/.bashrc" "$HOME"
cp -f "$source/.bash_logout" "$HOME"
cp "$source/.vimrc" "$HOME"

. ~/.profile
. ~/.bashrc

rm -f /etc/ssh/sshd_config.d/*
cat "$source/sshd_config" > /etc/ssh/sshd_config

cat "$source/50unattended-upgrades" > /etc/apt/apt.conf.d/50unattended-upgrades
cat "$source/20auto-upgrades" > /etc/apt/apt.conf.d/20auto-upgrades

cat > /etc/apt/listchanges.conf.d/listchanges.conf << EOF
[apt]
frontend=text
email_format=text
email_address=root
confirm=0
which=both
EOF

echo "kernel.printk = 3    4    1    7" >> /etc/sysctl.conf

timedatectl set-timezone America/New_York

PORTS=("SMTP" "IMAP" "IMAPS" "Mail submission" 465 "WWW Full")
for i in "${PORTS[@]}"; do
	ufw allow "$i"
done

ufw status verbose

systemctl restart sshd.service
systemctl restart fail2ban.service

# cp fail2ban.local /etc/fail2ban/
# cp jail.local /etc/fail2ban/

# Configure sudoers file.
# Defaults     !tty_tickets

# useradd -m -s /bin/bash <username> -G sudo
# usermod -aG sudo <username>

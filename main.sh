#/bin/bash

if [ $(id -u) -ne 0 ]
  then echo 'Canceled. Should be ran as root.'
  exit
fi

echo '[SYSTEM CONFIGURATION STARTED]'

echo '[PHASE BASE INIT]'

chmod +x *.init
chmod +x *.install

apt update
apt install -y wget \
  gpg \
  vim \
  curl \
  xz-utils \
  git

echo '[PHASE INIT]'
for f in *.init; do
  bash "$f"
done

apt update

echo '[PHASE INSTALL]'
for f in *.install; do
  bash "$f"
done

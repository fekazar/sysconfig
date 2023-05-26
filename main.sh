#/bin/bash

if [ $(id -u) -ne 0 ]
  then echo 'Canceled. Should be ran as root.'
  exit
fi

chmod +x *.init
chmod +x *.install

no_base="false"
for arg in "$@"
do
  echo $arg
  if [ "$arg" = "--nobase" ]; then 
    no_base=true
  fi
done

echo '[SYSTEM CONFIGURATION STARTED]'

if [ "$no_base" = "false" ];
  then echo '[PHASE BASE INIT]'

  apt update
  apt install -y wget \
    gpg \
    vim \
    curl \
    xz-utils \
    git
else
  echo '[SKIPPED PHASE BASE]'
fi

echo '[PHASE INIT]'
for f in *.init; do
  echo [INIT "$f"]
  bash "$f"
done

apt update

echo '[PHASE INSTALL]'
for f in *.install; do
  echo [INSTALL "$f"]
  bash "$f"
done

#/bin/bash

if [ $(id -u) -eq 0 ]
  then echo 'Configuration should not be ran as root.'
  exit
fi

for f in */config.sh; do
  bash $f  
done

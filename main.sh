#/bin/bash
echo '[SYSTEM CONFIGURATION STARTED]'

sudo apt update

for f in *.install; do
  bash "$f"
done

#!/bin/bash
content=$(wget 127.0.0.1:3000/Game/Fire -O -)
echo $content
sleep 15
./fire.sh
echo "done"

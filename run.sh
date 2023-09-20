#!/usr/bin/env bash

sleep 3 && ./open-browser.sh &

docker run --rm -it --net=host old-chrome-novnc chrome-linux/chrome --no-sandbox

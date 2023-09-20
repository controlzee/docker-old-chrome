#!/usr/bin/env bash

sleep 3 && ./open-browser.sh &

docker run --rm -it --network host old-chrome-novnc chrome-linux/chrome --no-sandbox

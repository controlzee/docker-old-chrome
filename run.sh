#!/usr/bin/env bash

sleep 3 && ./open-browser.sh &

docker run --rm -it -p 8080:8080 old-chrome-novnc chrome-linux/chrome --no-sandbox

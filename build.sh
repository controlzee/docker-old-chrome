#!/usr/bin/env bash

# choose a chrome version from https://vikyd.github.io/download-chromium-history-version/
# and then get a link to its chrome-linux.zip.
# you might need to change the ubuntu version (in the FROM on line 1 of the
# Dockerfile) to a newer or older version to match the age of the chrome
# version.
# in this case, I'm gonna use chrome 50
if ! [[ -e 'chrome-linux.zip' ]]; then
  CHROME_LINUX_ZIP_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F376674%2Fchrome-linux.zip?generation=1456102814758000&alt=media"
  curl "$CHROME_LINUX_ZIP_URL" > chrome-linux.zip
fi

docker build -t old-chrome-novnc .

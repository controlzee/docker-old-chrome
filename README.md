# old chrome docker image

A docker image running an old ubuntu version with an X11-over-vnc setup, suitable for running old versions of chrome in. It exposes the vnc server via a web client for easy connection.

Get an old version of chrome here: https://vikyd.github.io/download-chromium-history-version/#/

## Usage

```
# build the image
./build.sh
# run it
./run.sh
```

Then, open <http://localhost:8080/> to access the screen.

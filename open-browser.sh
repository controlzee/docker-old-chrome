#!/usr/bin/env bash

OPEN="open"
if [[ "$(uname)" != "Darwin" ]]; then
  OPEN="xdg-open"
fi

$OPEN http://localhost:8590

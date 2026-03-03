#!/usr/bin/bash

WORKDIR="/home/podrun/thecrib-www"
cd "$WORKDIR" || exit 1

# Fetches last updates from remote repository
git fetch origin
git reset --hard origin/main

# Rebuilds the website
podman run --rm \
  -v "$WORKDIR":/src \
  -w /src \
  docker.io/hugomods/hugo:debian \
  hugo --minify --gc --cleanDestinationDir

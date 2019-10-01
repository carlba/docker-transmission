#!/usr/bin/env bash

if [ "$1" == "--force" ]; then
  docker build --no-cache -t transmission --no-cache .
else
  docker build -t transmission --no-cache .
fi

docker build -t transmission --no-cache .
docker tag transmission carlba/transmission
docker push carlba/transmission

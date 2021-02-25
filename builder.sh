#!/bin/bash

export LANG=ja_JP.UTF-8
export SECONDS=0

# docker-compose build --no-cache | tee log/log-`date "+%Y%m%d_%H%M%S"`.txt | less -R +F
docker-compose up -d | tee log/log-`date "+%Y%m%d_%H%M%S"`.txt | less -R +F

echo "The processing took $SECONDS seconds"

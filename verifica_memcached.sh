#!/bin/bash

# Rodar dentro da instancia

function memcmd() {
  exec {memcache}<>/dev/tcp/10.61.11.61/11211
  printf "%s\n%s\n" "$*" quit >&${memcache}
  cat <&${memcache}
}

memcmd lru_crawler metadump all

# for id in $(memcmd stats items | grep -o ":[0-9]\+:" | tr -d : | sort -nu); do
#     memcmd stats cachedump $id 0
# done
#!/bin/bash

PLAYLISTS_DIR=/playlists
RECORDINGS_DIR=/recordings

function record {
  local -r IN=$1
  local -r OUT=$2

  #ffmpeg -re -i "${IN}" -c copy -bsf:a aac_adtstoasc "${OUT}"
  ffmpeg -protocol_whitelist "file,http,https,tcp,tls" -i "${IN}" -vcodec copy -acodec copy -copyts -y "${OUT}"
}

function block_for_change {
  inotifywait --exclude "(m3u8?)$" \
    --event modify,move,create,delete \
    $PLAYLISTS_DIR
}

function build {
  for path in ${PLAYLISTS_DIR}/*.m3u*; do
  file=`basename $path`

  m3u8_path="${path}"
  mp4_path="${RECORDINGS_DIR}/${file%.*}.mkv"

  if [ -f ${mp4_path} ]; then
    echo "Skipping ${file}, already recorded!"
  else
    echo "${m3u8_path} > ${mp4_path}"
    record "${m3u8_path}" "${mp4_path}"
  fi

  echo "Everything is done!"
done
}
build
while block_for_change; do
  build
done

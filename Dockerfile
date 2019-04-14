FROM alpine:latest

RUN apk add --no-cache ca-certificates ffmpeg libva-intel-driver inotify-tools bash

RUN mkdir /usr/app
WORKDIR /usr/app
COPY run.sh .

ENTRYPOINT ["./run.sh"]

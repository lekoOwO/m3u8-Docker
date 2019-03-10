# FFMPEG insert into blank Debian to minimize image size

# FROM debian:stable

# RUN apt-get update
# RUN apt-get install -y inotify-tools ffmpeg
# RUN apt-get clean

# CMD           ["--help"]
# ENTRYPOINT    ["ffmpeg"]

FROM alpine:latest

RUN apk upgrade -U \
    && apk add ca-certificates ffmpeg libva-intel-driver inotify-tools bash \
    && rm -rf /var/cache/*

RUN mkdir /usr/app
WORKDIR /usr/app
COPY run.sh .

ENTRYPOINT ["./run.sh"]

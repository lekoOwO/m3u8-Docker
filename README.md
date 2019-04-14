# m3u8-Docker
Download m3u8 videos with docker.

## Usage
Simpliy do the docker-compose.
The container will monitor the change of `/playlists`, which is set in compose config,  and download videos into `/recordings` with only combining ts files into a single mkv file.

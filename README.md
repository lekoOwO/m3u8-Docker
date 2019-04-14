# m3u8-Docker
Download m3u8 videos with docker.

## Usage
Simpliy do the docker-compose.
The container will monitor the change of `/playlists`, which is set in compose config,  and download videos into `/recordings` with only combining ts files into a single mkv file.

## Tips
If there are changes in `/playlists`, the container will download any m3u8 files whose corresponding mkv does not exist in `/recordings`.
Thus, when moving mkv files, please remember to delete or move the corresponding m3u8 file too. Otherwise, the mkv file will be downloaded on next `/playlists` change.

FROM python:3.7-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install ffmpeg  curl -y && \
    curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

ENTRYPOINT [ "sh","/config/download_music.sh" ]


FROM ubuntu:latest
LABEL authors="harry"

ENTRYPOINT ["top", "-b"]
# jutil-docker

Dockerfiles for the [`jaysong/jutil`](https://hub.docker.com/r/jaysong/jutil/) Docker
Hub images which servers a java-based utility container.

## How-To:
To start the container and mount the `/data` volume, use
```
docker run -it --name jutil -v $(pwd)/tmp:/data jaysong/jutil:8
```

To exit the container, type `ctrl + d`.

To restart the container, use
```
docker start -ai jutil
```

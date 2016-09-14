# jutil-docker

Dockerfiles for the [`jaysong/jutil`](https://hub.docker.com/r/jaysong/jutil/) Docker
Hub images which servers a java-based utility container.

## How-To:
### Use the container
To start the container and mount the `/data` volume, use
```
docker run -it --name jutil -v $(pwd)/tmp:/data jaysong/jutil:8
```

To exit the container, type `ctrl + d`.

To restart the container, use
```
docker start -ai jutil
```

### Eclipse Memory Analyzer
1. Edit the /usr/bin/mat/MemoryAnalyzer.ini to make sure it has sufficient memory
```
-Xmx32g
-XX:+UseConcMarkSweepGC
-XX:+UseParNewGC
-XX:+CMSParallelRemarkEnabled
-XX:+CMSClassUnloadingEnabled
-XX:+UseCMSInitiatingOccupancyOnly
```
2. Then cd to /usr/bin/mat and run
```
./ParseHeapDump.sh /data/java_pid1.hprof org.eclipse.mat.api:suspects org.eclipse.mat.api:overview org.eclipse.mat.api:top_components
```

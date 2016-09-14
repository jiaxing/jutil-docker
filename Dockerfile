FROM java:8

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    gdb \
    osmctools \
  && rm -rf /var/lib/apt/lists/*

ARG MAT_SHA512=212713dff859ff8f2b1cb898584ff0a1c16abf4ef0264ef5cc410416957ac5282bb02f2e4ecd46dbb0e7beb3fbfce229588f1231cb88b725af5ca62b22c23b3c
ARG MAT_URL=http://mirror.csclub.uwaterloo.ca/eclipse/mat/1.6/rcp/MemoryAnalyzer-1.6.0.20160531-linux.gtk.x86_64.zip

ADD $MAT_URL /usr/bin/mat.zip

WORKDIR /usr/bin
RUN echo "$MAT_SHA512  mat.zip" | sha512sum -c - && \
  unzip mat.zip && \
  rm mat.zip && \
  ln -s mat/MemoryAnalyzer MemoryAnalyzer

VOLUME ["/app", "/data"]
WORKDIR /app

CMD ["/bin/bash"]

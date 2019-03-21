FROM tensorflow/tensorflow:1.5.0-devel-gpu
RUN apt-get update  \
    && apt-get install -y s3fs  \
    && rm -rf /var/lib/apt/lists/*
ADD . /
ENTRYPOINT ["/run.sh"]

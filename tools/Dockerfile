FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

RUN apt-get update && \
    apt-get install --yes build-essential openslide-tools

COPY . /opt/FLamby
RUN cd /opt/FLamby && \
    pip install -e .[cam16]

FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

RUN apt-get update && \
    apt-get install --yes build-essential openslide-tools

COPY . /workspace
RUN cd /workspace && \
    pip install -e .[cam16]

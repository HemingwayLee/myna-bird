FROM nvidia/cuda:11.3.1-cudnn8-runtime-ubuntu20.04

ENV INFERENCE_MODE=true
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential \
    ffmpeg \
    python3-pip \
    make \
    pkg-config \
    libsm6 \
    libxext6 \
    software-properties-common

RUN mkdir -p /app/code
WORKDIR /app/code
COPY . .

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.nvidia.txt 
RUN pip3 install torch==1.10.0+cu113 torchvision==0.11.0+cu113 --extra-index-url https://download.pytorch.org/whl/cu113


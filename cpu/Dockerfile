# CPU container running fast.ai and jupyter
#FROM python:3.7.3-stretch
FROM ubuntu:18.04

RUN mkdir -p /app 
WORKDIR /app

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8" PATH="/opt/venv/bin:$PATH" PYTHONPATH="/usr/src/app:$PYTHONPATH" PIP_NO_CACHE_DIR="false"
ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        vim \
        ca-certificates \
        libreadline-gplv2-dev \
        libncursesw5-dev \
        libssl-dev \ 
        libsqlite3-dev \ 
        tk-dev \
        libgdbm-dev \ 
        libc6-dev \
        libbz2-dev \
        libjpeg-dev \
        freeglut3 \
        freeglut3-dev \ 
        libxi-dev \ 
        libxmu-dev \
        zip \
        unzip \
        libpng-dev \
        python3-dev \
        protobuf-compiler \
        python3-pip && \
     rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install setuptools
# pytorch
#RUN pip3 install torch==1.3.1+cpu torchvision==0.4.2+cpu -f https://download.pytorch.org/whl/torch_stable.html

# fastai
RUN pip3 install fastai

# supporting libraries including starlette 
RUN pip3 install aiohttp asyncio uvicorn starlette jupyter pillow==6.1 pytest

# set-up user for jupyter notebook
RUN useradd -ms /bin/bash jupyter
USER jupyter

# Set the container working directory to the user home folder
WORKDIR /home/jupyter
CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root
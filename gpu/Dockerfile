# CPU container running fast.ai and jupyter
FROM nvidia/cuda:10.1-base-ubuntu18.04
#nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN mkdir -p /app 
WORKDIR /app

LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV LANG="C.UTF-8" LC_ALL="C.UTF-8" PATH="/opt/venv/bin:$PATH" PYTHONPATH="/usr/src/app:$PYTHONPATH" PIP_NO_CACHE_DIR="false"
ARG DEBIAN_FRONTEND=noninteractive

USER root

# --- python and other native stuff ----

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
        ninja-build \
        python3-dev \
        protobuf-compiler \
        python3-pip && \
     rm -rf /var/lib/apt/lists/*

# ------------------------------

RUN pip3 install --upgrade pip
RUN pip3 install setuptools

# make sure we can run scrips with python command even though python2 is not installed
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

# fastai
RUN pip3 install fastai

# supporting libraries including starlette 
RUN pip3 install aiohttp asyncio uvicorn starlette jupyter pillow==6.1 pytest

#RUN git clone https://github.com/fastai/course-v3.git

# set-up user for jupyter notebook
RUN useradd -ms /bin/bash jupyter
USER jupyter

# Set the container working directory to the user home folder
WORKDIR /home/jupyter
CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root

## issues / notes
## fails fastai test: make test-fast
## also wont run this:
## python3
## >>> from fastai.text.models.qrnn import QRNN, QRNNLayer
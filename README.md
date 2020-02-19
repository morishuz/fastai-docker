# fastai-docker

Docker Container supporting the [PyTorch](https://pytorch.org/) based [fast.ai](https://www.fast.ai/) library and Jupyter notebooks

This docker is designed for development not deployment. During build no code is copied to the container, instead it mounts the current repository directory as ``/local``.  

## CPU

A CPU only version specifically for use on non-GPU backend servers, MacOS or Windows desktops.  

```
cd cpu
```

build:

```
make build
```

launch jupyter:

```
make run
```

bash
```
make bash
```

## GPU

For linux machines. Requires a GPU, CUDA and nvidia docker. Currently this image is build assuming CUDA 10.1. To work with other versions, modify the ``xx.x`` in this first line of the GPU Dockerfile: ``FROM nvidia/cuda:xx.x-cudnn7-devel-ubuntu18.04``

```
cd gpu
```

build:

```
make build
```

launch jupyter:

```
make run
```

bash
```
make bash
```
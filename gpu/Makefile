# name of the container:
NAME=gpu_fastai

# get local dir path
srcdir ?= $(shell pwd)/..

build:
	docker build -f Dockerfile -t $(NAME) .

# force complete rebuild
rebuild:
	docker build -f Dockerfile -t $(NAME) . --pull --no-cache

# run with jupyter
run:
	nvidia-docker run --rm --ipc=host -w /local/src -it -p 8888:8888 -v $(srcdir):/local $(NAME)

# using bash
bash:
	nvidia-docker run --rm --ipc=host -w /local/src -it -p 8888:8888 -v $(srcdir):/local $(NAME) bash

	
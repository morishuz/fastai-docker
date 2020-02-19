# name of the container:
NAME=gpu_fastai

# get local dir path
srcdir ?= $(shell pwd)

build:
	docker build -f Dockerfile -t $(NAME) .

# force complete rebuild
rebuild:
	docker build -f Dockerfile -t $(NAME) . --pull --no-cache

run_gpu:
	nvidia-docker run --rm --ipc=host -w /local -it -p 8888:8888 -v $(srcdir):/local $(NAME)

bash_gpu:
	nvidia-docker run --rm --ipc=host -w /local -it -p 8888:8888 -v $(srcdir):/local $(NAME) bash

	
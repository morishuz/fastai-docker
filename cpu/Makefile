# name of the container:
NAME=cpu_fastai

# get local dir path
srcdir ?= $(shell pwd)/..

build:
	docker build -f Dockerfile -t $(NAME) .

# force complete rebuild
rebuild:
	docker build -f Dockerfile -t $(NAME) . --pull --no-cache

# run with jupyter
run:
	docker run --rm --ipc=host -w /local/src -it -p 8888:8888 -v $(srcdir):/local $(NAME)

# using bash
bash:
	docker run --rm --ipc=host -w /local/src -it -p 8888:8888 -v $(srcdir):/local $(NAME) bash

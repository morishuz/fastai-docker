# name of the container:
NAME_CPU=cpu_fastai

# get local dir path
srcdir ?= $(shell pwd)

build:
	docker build -f Dockerfile -t $(NAME_CPU) .

# force complete rebuild
rebuild:
	docker build -f Dockerfile -t $(NAME_CPU) . --pull --no-cache	

# run with jupyter
run:
	docker run --rm -w /local -it -p 8888:8888 -v $(srcdir):/local $(NAME_CPU)

# using bash
bash:
	docker run --rm -w /local -it -p 8888:8888 -v $(srcdir):/local $(NAME_CPU) bash


	
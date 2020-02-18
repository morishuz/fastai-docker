# name of the container:
NAME_CPU=cpu_fastai
NAME_GPU=gpu_fastai

# get local dir path
srcdir ?= $(shell pwd)

build:
	docker build -f Dockerfile -t $(NAME_CPU) .

build_gpu:
	docker build -f Dockerfile.gpu -t $(NAME_GPU) .	

# force complete rebuild
rebuild:
	docker build -f Dockerfile -t $(NAME_CPU) . --pull --no-cache

rebuild_gpu:
	docker build -f Dockerfile.gpu -t $(NAME_GPU) . --pull --no-cache	


# run with jupyter
run:
	docker run --rm --ipc=host -w /local -it -p 8888:8888 -v $(srcdir):/local $(NAME_CPU)

run_gpu:
	nvidia-docker run --rm --ipc=host -w /local -it -p 8888:8888 -v $(srcdir):/local $(NAME_GPU)

# using bash
bash:
	docker run --rm --ipc=host -w /local -it -p 8888:8888 -v $(srcdir):/local $(NAME_CPU) bash

bash_gpu:
	nvidia-docker run --rm --ipc=host -w /local -it -p 8888:8888 -v $(srcdir):/local $(NAME_GPU) bash

	
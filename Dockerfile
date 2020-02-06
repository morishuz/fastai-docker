# CPU container running fast.ai and jupyter

FROM python:3.7.3-stretch

RUN mkdir -p /app 
WORKDIR /app

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8" PATH="/opt/venv/bin:$PATH" PYTHONPATH="/usr/src/app:$PYTHONPATH" PIP_NO_CACHE_DIR="false"

USER root

# pytorch
RUN pip3 install torch==1.3.1+cpu torchvision==0.4.2+cpu -f https://download.pytorch.org/whl/torch_stable.html

# supporting libraries including starlette 
RUN pip3 install fastai aiohttp asyncio uvicorn starlette jupyter pillow==6.1

# set-up user for jupyter notebook
RUN useradd -ms /bin/bash jupyter
USER jupyter

# Set the container working directory to the user home folder
WORKDIR /home/jupyter
CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root
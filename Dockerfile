FROM python:3.8-slim
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt update
RUN apt-get install -y wget git
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/CompVis/stable-diffusion.git
WORKDIR /app/stable-diffusion
COPY ./txt2img.py /app/stable-diffusion/scripts/txt2img.py
RUN conda env create -f environment.yaml
# RUN conda activate ldm
RUN wget https://www.googleapis.com/storage/v1/b/aai-blog-files/o/sd-v1-4.ckpt
#
RUN apt install libglib2.0-0 libsm6 libxext6 libxrender1 -y
# run
# SHELL ["conda", "run", "-n", "ldm", "/bin/bash", "-c"]
# conda run -n ldm /bin/bash -c "python scripts/txt2img.py --prompt 'talking chicken nuggets being scared to be eaten' --plms --ckpt sd-v1-4.ckpt --skip_grid --n_samples 1"
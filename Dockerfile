FROM pytorch/pytorch:latest
RUN mkdir /app
WORKDIR /app
RUN apt update && apt install -y curl git
RUN git clone https://github.com/CompVis/stable-diffusion.git
WORKDIR /app/stable-diffusion
RUN curl https://www.googleapis.com/storage/v1/b/aai-blog-files/o/sd-v1-4.ckpt?alt=media > sd-v1-4.ckpt

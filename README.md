dockerized https://github.com/CompVis/stable-diffusion

needs to run the command a little different to activate docker:

`conda run -n ldm /bin/bash -c "python scripts/txt2img.py --prompt 'talking chicken nuggets being scared to be eaten' --plms --ckpt sd-v1-4.ckpt --skip_grid --n_samples 1"`

## usage

1. Connect to machine

`docker run -v ./images:/app/stable-diffusion/output/ --rm -it --entrypoint bash guestros/stable-duffusion:weights-1.4`

2. execute the command as stated at stable-diffusion inside conda run

`conda run -n ldm /bin/bash -c "python scripts/txt2img.py --prompt 'talking chicken nuggets being scared to be eaten' --plms --ckpt sd-v1-4.ckpt --skip_grid --n_samples 1"`

3. images will show up locally in the "image" folder
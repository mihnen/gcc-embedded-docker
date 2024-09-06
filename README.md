# gcc-embedded-docker

# Building local image

- `docker build -t mihnen/gcc-embedded-docker .`

# Pull latest image from Github container repository

- `docker pull ghcr.io/mihnen/gcc-embedded-docker:master`

# Running image

- Change to directory of your source code
- Windows
	- `docker run --rm -it --privileged -v "%cd%:/home/app" mihnen/gcc-embedded-docker:latest zsh`
- Linux
	- `docker run --rm -it --privileged -v "$(pwd):/home/app" gcc-embedded-docker:latest zsh`

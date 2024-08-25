# gcc-embedded-docker

# Building image

- `docker build -t mihnen/devenv`

# Running image

- Go to directory of source code
- Windows
	- `docker run --rm -it --privileged -v "%cd%:/home/app" mihnen/devenv:latest zsh`
- Linux
	- `docker run --rm -it --privileged -v "$(pwd):/home/app" mihnen/devenv:latest zsh`
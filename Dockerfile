# sytax=docker/dockerfile:1
FROM debian:bookworm-slim
SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND: noninteractive
ENV TZ: Etc/UTC
COPY scripts/install-arm-none-eabi.sh /scripts/install-arm-none-eabi.sh
RUN chmod +x /scripts/install-arm-none-eabi.sh
RUN apt-get clean &&      \
    apt-get update &&     \
    apt-get install --no-install-recommends -y \
      build-essential     \
      cmake               \
      git                 \
      ninja-build         \
      srecord             \
      python3             \
      python3-venv        \
      pandoc              \
      zsh                 \
			bash                \
			nano                \
      wget                \
      openssh-client
RUN   apt-get install -y     		\
      texlive 									\
			texlive-latex-base 				\
			texlive-fonts-recommended \
			texlive-fonts-extra 			\
			texlive-latex-extra 			\
			texlive-science 					\
			latexmk
RUN /scripts/install-arm-none-eabi.sh
ENTRYPOINT /bin/bash -c "git config --global --add safe.directory $PWD" && zsh
WORKDIR /home/app
CMD ["zsh"]

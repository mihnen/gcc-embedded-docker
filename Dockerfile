# sytax=docker/dockerfile:1
FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND: noninteractive
ENV TZ: Etc/UTC
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
      zsh &&              \
    apt-get install --no-install-recommends -y \
      gcc-arm-none-eabi                        \
      libnewlib-arm-none-eabi                  \
      libstdc++-arm-none-eabi-newlib
ENTRYPOINT sh -c "git config --global --add safe.directory $PWD" && zsh
WORKDIR /home/app
CMD ["zsh"]

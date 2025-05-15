# Use the standard Ubuntu image as a base
FROM ubuntu:latest

# Switch to root user (default in Dockerfile/Containerfile build)
USER root

RUN apt update && \
    apt install -y --no-install-recommends \
    build-essential \
    git \
    wget \
    chrpath \
    diffstat \
    liblz4-tool \
    wpasupplicant \
    python3 \
    locales \
    cpio file gawk zstd \
    ca-certificates && \
    update-ca-certificates

RUN sed -i -e 's/# en_US.UTF-8 UTF-8.*/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /home/ubuntu/yocto

USER ubuntu


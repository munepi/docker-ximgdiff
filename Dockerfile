FROM debian:buster-slim
LABEL maintainer="munepixyz@gmail.com"

ENV LANG en_US.UTF-8

## setup
RUN apt-get update && \
        apt-get install -y --no-install-recommends locales git-core curl ca-certificates && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
        locale-gen en_US.UTF-8 && \
        update-locale en_US.UTF-8

## install OpenCV environment & its related tools
RUN apt-get update && \
        apt-get install -y --no-install-recommends \
        python-opencv libopencv-dev cmake \
        ghostscript poppler-utils \
        build-essential && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

## build&install ximgdiff
RUN git clone --recursive --depth 1 https://github.com/Quramy/x-img-diff.git && \
        mkdir x-img-diff/build && \
        cd x-img-diff/build && \
        cmake .. && \
        make install && \
        cd - && \
        rm -rf x-img-diff

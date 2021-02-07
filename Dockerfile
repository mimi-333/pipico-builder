FROM ubuntu:20.04

RUN sed -i 's|archive.ubuntu.com|ftp.jaist.ac.jp|g' /etc/apt/sources.list

RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install -y python3 cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential git

WORKDIR /pico

RUN git clone -b master https://github.com/raspberrypi/pico-sdk.git \
 && cd pico-sdk \
 && git submodule update --init

RUN cp pico-sdk/external/pico_sdk_import.cmake .

WORKDIR /pico/code/build

CMD bash -c "cp ../../pico_sdk_import.cmake ../ && cmake .. && make"
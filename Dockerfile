FROM ubuntu:18.04

LABEL \
    maintainer="stepney141" \
    version="1.0" \
    description="Ndless SDK"

WORKDIR /opt/ndless-dev

## Install dependencies
RUN apt-get update -y \
 && apt-get install -y \
    git build-essential binutils libgmp-dev libmpfr-dev libmpc-dev zlib1g zlib1g-dev zlib1g-dbg libboost-dev libboost-program-options-dev wget

## Configure Ndless and the SDK
# RUN git clone --recursive https://github.com/ndless-nspire/Ndless.git
RUN git clone --recursive https://github.com/stepney141/Ndless.git
RUN cd /opt/ndless-dev/Ndless/ndless-sdk/toolchain \
#  && sed -i -e "1 s/sh/bash/g" -e "16i echo 'now processing...'" build_toolchain.sh \
 && sed -i -e "1 s/sh/bash/g" build_toolchain.sh
RUN cd /opt/ndless-dev/Ndless/ndless-sdk/toolchain \
 && chmod +x build_toolchain.sh \
#  && cat build_toolchain.sh \
 && bash -vx ./build_toolchain.sh

## Set PATH before building the toolchain
ENV PATH /opt/ndless-dev/Ndless/ndless-sdk/toolchain/install/bin:/opt/ndless-dev/Ndless/ndless-sdk/bin:$PATH

## Build Ndless and the SDK
RUN cd /opt/ndless-dev/Ndless \
 && make \
 && nspire-gcc

CMD ["/bin/sh"]
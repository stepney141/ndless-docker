FROM ubuntu:20.04

LABEL \
    maintainer="stepney141" \
    version="1.0" \
    description="Ndless SDK"

WORKDIR /ndless-dev

# Install dependencies
RUN apt-get update -y \
 && apt-get install -y \
    git build-essential binutils libgmp-dev libmpfr-dev libmpc-dev zlib1g zlib1g-dev libboost-dev libboost-program-options-dev wget

# Configure Ndless and the SDK
RUN git clone --recursive https://github.com/ndless-nspire/Ndless.git \
 && cd Ndless/ndless-sdk/toolchain \
 && chmod +x build_toolchain.sh \
 && bash ./build_toolchain.sh

# Set PATH before building the toolchain
ENV PATH /ndless-dev/Ndless/ndless-sdk/toolchain/install/bin:/ndless-dev/Ndless/ndless-sdk/bin:$PATH

# Build Ndless and the SDK
RUN cd /ndless-dev/Ndless \
 && make \
 && nspire-gcc

CMD ["/bin/bash"]
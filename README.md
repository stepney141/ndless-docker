# Ndless-docker

A Docker image for [Ndless SDK](https://github.com/ndless-nspire/Ndless/), the toolchain to develop C and assembly programs for the TI-Nspire graphing calculator.
[Firebird Emu](https://github.com/nspire-emus/firebird) is not supported in this repository so far.

## Why docker?

- I didn't want to scatter my local environment for *just a toolchain*
- [The official Docker image](https://hub.docker.com/r/ndless/ndless-sdk) is old and not maintained

## Usage

### What you need to do first

```bash
git clone https://github.com/stepney141/ndless-docker
cd ndless-docker
docker-compose up
```

### When you edit your sources

At first you need to do the following operation:

```bash
cd <your_directory_path>/ndless-docker/src
nspire-tools new "program-name"
```

Then the toolchain will create a Makefile to build ``program-name.tns``.  
After that you will create a new ``*.c`` file, edit your program, and run ``make`` to build it.

In default settings, your sources need to be in ``ndless-docker/src``.  
You can change all configs by modifying ``docker-compose.yml``.

## Reference

[Ndless SDK: C and assembly development introduction · ndless-nspire/Ndless Wiki](https://github.com/ndless-nspire/Ndless/wiki/Ndless-SDK:-C-and-assembly-development-introduction)

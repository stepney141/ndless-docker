# Ndless-docker

A Dockerfile for [Ndless SDK](https://github.com/ndless-nspire/Ndless/), the toolchain to develop C and assembly programs for the TI-Nspire graphing calculator.
[Firebird Emu](https://github.com/nspire-emus/firebird) is not supported in this repository so far.

## Why docker?

- I didn't want to scatter my local environment for *just a toolchain*
- [The official Docker image](https://hub.docker.com/r/ndless/ndless-sdk) is old and not maintained

## Usage

### How to install Ndless SDK

```bash
$ git clone https://github.com/stepney141/ndless-docker
$ cd ndless-docker
$ docker-compose up -d
```

That is all. If the SDK has been installed correctly, you should see some outputs similar to these:

```
...
make[3]: Leaving directory '/opt/ndless-dev/Ndless/ndless/src/installer-5.2'
make[2]: Leaving directory '/opt/ndless-dev/Ndless/ndless/src'
make[1]: Leaving directory '/opt/ndless-dev/Ndless/ndless'
Removing intermediate container d69c543bbab8
 ---> 3715a1d66a8f
Successfully built 3715a1d66a8f
Successfully tagged ndless-docker_ndless-dev:latest
```

For your information, the installation took 78 minutes on my HP Spectre 13-ae019TU laptop computer.

### How to build your sources

At first you need to do the following operation:

```bash
$ cd ndless-docker/src
$ nspire-tools new "program-name"
```

Then the toolchain will create a Makefile to build ``program-name.tns``.  
Next create a new ``*.c`` file, edit your program, and run ``make`` to build it.

In default settings, your sources have to be in ``ndless-docker/src``.  
You can change all configs by modifying ``docker-compose.yml``.

## Reference

[Ndless SDK: C and assembly development introduction · ndless-nspire/Ndless Wiki](https://github.com/ndless-nspire/Ndless/wiki/Ndless-SDK:-C-and-assembly-development-introduction)

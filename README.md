# Ndless-docker

Dockerfile for [Ndless SDK](https://github.com/ndless-nspire/Ndless/), the toolchain to develop C and assembly programs for the TI-Nspire graphing calculator.
[The official Docker image](https://hub.docker.com/r/ndless/ndless-sdk) is old and not maintained so have a try at this "Ndless-docker".

## Why docker?

- Installing a toolchain with Docker won't clutter your local environment
- You can use Ndless SDK anywhere Docker runs

## Requirements

- Docker
- Docker Compose

## Usage

### How to install Ndless SDK with Docker

```
$ git clone https://github.com/stepney141/ndless-docker
$ cd ndless-docker
$ docker-compose up -d --build
```

That is all. If the SDK has been installed correctly, you should see some outputs similar to these ones:

```
...
make[3]: Leaving directory '/opt/ndless-dev/Ndless/ndless/src/installer-5.2'
make[2]: Leaving directory '/opt/ndless-dev/Ndless/ndless/src'
make[1]: Leaving directory '/opt/ndless-dev/Ndless/ndless'
Removing intermediate container d69c543bbab8
 ---> 3715a1d66a8f
Successfully built 3715a1d66a8f
Successfully tagged ndless-docker_ndless-dev:latest
Creating ndless-dev ... 
Creating ndless-dev ... done
```

In general, building and installing a cross compiler tends to take a long time.
For instance, setting up Ndless SDK with this Dockerfile took 78 minutes on my HP Spectre 13-ae019TU laptop computer.

If you get output messages like the above ones, you can stop the Docker container:

```
$ docker-compose down
```

### How to build your source

First, make sure that your source files are in ``ndless-docker/src`` on your local storage.

After starting the Docker container with ``cd ndless-docker && docker-compose up -d``, enter in it with ``docker-compose exec ndless-dev bash`` and do following operations in the container:

```
# cd /opt/ndless-dev/src
# nspire-tools new "program-name"
```

Then the toolchain will create a Makefile to build ``program-name.tns``.  
Next, run ``make`` in the Docker container to build it.

In default settings, your sources have to be in ``ndless-docker/src`` on local.  
You can change all configs for the container by modifying ``docker-compose.yml``.

## Reference

[Ndless SDK: C and assembly development introduction · ndless-nspire/Ndless Wiki](https://github.com/ndless-nspire/Ndless/wiki/Ndless-SDK:-C-and-assembly-development-introduction)

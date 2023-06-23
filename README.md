# Dockerfile for Mowgli

This image uses open_mower_ros as base and adds rosserial-server, launch file and configuration files that are needed to run openmower using the stock hardware with the Mowgli firmware. 

## Requirements

1. Docker or Podman
2. Mowgli firmware (requires [fork](https://github.com/cedbossneo/Mowgli) that uses mower topics instead of mowgli specific topics)

## Install

First, install Docker or Podman. Docker can be installed using the following script:
```bash
curl https://get.docker.com | sh
```

Clone this repository:
```bash
git clone https://github.com/mnh-jansson/mowgli-docker
```

Run container using:
```bash
docker-compose up -d
```


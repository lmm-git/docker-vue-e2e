FROM ubuntu:bionic

MAINTAINER Leonard Marschke <github@marschke.me>

# Set pythonunbuffered for getting better outputs in combination with GitLab CI
ENV PYTHONUNBUFFERED=1

# Set noninteractive environment
ENV DEBIAN_FRONTEND=noninteractive

# Set language environment to UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# install build dependencies
RUN apt-get update \
# upgrade software
	&& apt-get -y upgrade \
	&& apt-get -y install apt-transport-https \
		ca-certificates \
		curl \
# clean up
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# update software repos
RUN apt-get update \
# upgrade software
	&& apt-get -y upgrade \
	&& apt-get -y install apt-utils \
# install some useful tools need to build grml (git is needed to use with gitlab ci)
	&& apt-get -y install \
# install essential build tools
		git \
# install tools for cypress
		libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb \
# clean up
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
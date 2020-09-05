FROM ubuntu:20.04 AS base

LABEL image r-base


# Install base packages
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y \
	sudo \
	gnupg \
	wget

RUN apt-get update && apt-get install -y \
	vim \
	software-properties-common \
	libssl-dev \
	libcurl4-openssl-dev \
	libxml2-dev

# Install base R
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
RUN apt update
RUN apt-get install -y \
	r-base \
    jags


# Install user yogi
RUN adduser yogi --disabled-password
RUN usermod -aG sudo yogi
RUN echo "%sudo   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "Set disable_coredump false" >> /etc/sudo.conf

USER yogi

WORKDIR /home/yogi
RUN mkdir -p /home/yogi/.R/lib
ENV R_LIBS="/home/yogi/.R/lib"

RUN mkdir /home/yogi/covid

# copy requirements separately from code for better caching
COPY requirements.R /home/yogi/requirements.R
RUN  Rscript --vanilla /home/yogi/requirements.R

CMD bash
# FROM ubuntu:22.04
FROM python:3.6

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Use bash
SHELL ["/bin/bash", "-c"]

# Set the working directory
WORKDIR /work

# Copy the application code
COPY . /work

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget \
    git \
    vim \
    virtualenv \
    mafft \
    schedtool \
    libpcap-dev

# Install python packages
RUN pip install numpy==1.19.5 && \
    pip install impacket && \
    pip install -r requirements.txt

# Patching Netzob
RUN patch -p1 $(find / -name "PCAPImporter.py") -i netzob.patch
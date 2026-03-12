FROM python:3.13-slim AS compile-image

ENV DEBIAN_FRONTEND=noninteractive
RUN BUILDPKGS="build-essential \
        libcurl4-openssl-dev \
        zlib1g-dev \
        libfftw3-dev \
        libc++-dev \
        git \
        wget \
        hdf5-tools \
	libffi-dev \
	musl-dev \
	gcc \
	make \
	cmake \
	libxml2-dev \ 
	libxslt-dev \
	gfortran \
	libopenblas-dev \
	libcairo2-dev \
	llvm \
        " && \
    apt-get update && \
    apt-get install -y --no-install-recommends apt-utils debconf locales locales-all && dpkg-reconfigure locales && \
    apt-get install -y --no-install-recommends $BUILDPKGS

# Install Miniconda on x86 or ARM platforms
RUN arch=$(uname -m) && \
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-py313_26.1.1-1-Linux-x86_64.sh"; \
    wget $MINICONDA_URL -O miniconda.sh && \
    mkdir -p /root/.conda && \
    bash miniconda.sh -b -p /root/miniconda3 && \
    rm -f miniconda.sh

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN python -m venv /opt/venv
# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"

# install mamba
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
RUN conda config --add channels conda-forge
RUN conda install mamba -n base -c conda-forge

# install dependencies:
RUN pip install --no-cache-dir setuptools==80.9.0 \
	ome-zarr==0.13.0 \
	spatialdata \
	spatialdata-io \
	spatialdata-plot \
	squidpy \
	leidenalg \ 
	ipywidgets \
	ipykernel

#!/bin/bash

# Enable powertools repo
yum install -y dnf-plugins-core
yum config-manager --set-enabled powertools

# Needed for subsequent yum installs to work
touch /var/lib/rpm/*

# Install packages
yum install -y \
  git \
  blas \
  lapack \
  python3-devel \
  python3 \
  wget \
  which \
  tar \
  libtool \
  emacs \
  sudo \
  file \
  make \
  gcc \
  gcc-c++ \
  gcc-gfortran \
  patch \
  xz \
  bzip2 \
  diffutils \
  bison \
  flex

# Clear cache
yum clean all
rm -rf /var/cache/yum/

# Make symbolic link for invoking Python
ln -s /usr/bin/python3 /usr/bin/python

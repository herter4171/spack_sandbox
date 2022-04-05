#!/bin/bash -l

spack load gcc

curl -L -O http://www.mpich.org/static/downloads/3.3/mpich-3.3.tar.gz
tar -xf mpich-3.3*

cd mpich-3.3 && mkdir gcc-build && cd gcc-build

# Configure build env
../configure --prefix=/usr/local \
--enable-shared \
--enable-sharedlibs=gcc \
--enable-fast=O2 \
--enable-debuginfo \
--enable-totalview \
--enable-two-level-namespace \
CC=gcc \
CXX=g++ \
FC=gfortran \
F77=gfortran \
F90='' \
CFLAGS='' \
CXXFLAGS='' \
FFLAGS='-w -fallow-argument-mismatch -O2' \
FCFLAGS='' \
F90FLAGS='' \
F77FLAGS=''

# Build and install
make -j `nproc`
make install

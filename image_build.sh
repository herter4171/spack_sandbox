#!/bin/bash

# Build GCC
docker build -t spack_test .

# Build MPICH
docker build -t spack_mpich -f Dockerfile.mpich .

# Build MOOSE submodules
docker build -t spack_submods -f Dockerfile.submods .

#!/bin/bash

# Build GCC
docker build -t spack_mpich .

# Build MOOSE submodules
docker build -t spack_submods -f Dockerfile.submods .

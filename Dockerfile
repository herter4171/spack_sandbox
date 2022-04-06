FROM rockylinux:8.5

WORKDIR /opt

# Install Yum packages
COPY yum_installs.sh .
RUN /bin/bash yum_installs.sh

# Pull in MOOSE with submodules
RUN git clone https://github.com/idaholab/moose.git ; \
cd moose ; \
git checkout a792556ec4633f6a0184598c705e9781a651744f ; \
git submodule update --init --recursive

ENV SPACK_SRC=". /opt/spack/share/spack/setup-env.sh"
ARG GCC_VER=10.3.0

# Install Spack, texinfo to enable GCC, and GCC
RUN git clone -c feature.manyFiles=true https://github.com/spack/spack.git ; \
$SPACK_SRC ; \
spack compiler find ; \
spack install -j `nproc` texinfo ; \
spack load texinfo ; \
spack install -j `nproc` gcc@$GCC_VER ; \
spack load gcc@$GCC_VER ; \
spack compiler find

# Install MPICH
RUN sed -i 's|flags.*$|flags:\n      fflags: -fallow-argument-mismatch|g' /root/.spack/linux/compilers.yaml ; \
$SPACK_SRC ; \
spack load gcc@$GCC_VER ; \
spack install -j `nproc` --reuse mpich %gcc@$GCC_VER

# Ensure Spack loads on launch
RUN printf "$SPACK_SRC" >> /etc/profile
CMD /bin/bash -l

#spack_sandbox

This covers adding GCC with Spack, then building MPICH, PETSc, and LibMesh on top of a Rocky Linux 8.5 base.
> PETSc currently has an immediate seg fault when running `configure`

To attempt building the images,
```
/bin/bash image_build.sh
```

Last of all, the image made by `Dockerfile` has been pushed to `herter4171/spack_tinkering:latest` for easy access.
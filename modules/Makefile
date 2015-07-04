MPATH=$(HOME)/local/modules
MODULES=magma-base dealii-serial gcc-4.9.3 gperftools \
	ipm julia lapack llvm \
	mpip openblas openmpi-1.8.6 petsc ploticus R \
	slepc sprng sundials tau trilinos-serial upc visit \
	anaconda 

.PHONY: install
install:
	install -t $(MPATH) $(MODULES)

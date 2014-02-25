
APCPATH=/share/cs-instructional/cs5220

SCRIPTS=setup_ipython_htc.sh setup_ipython_mpi.sh setup_ipython_nbserver.sh \
	setup.sh vars.sh vars.csh

.PHONY: install

install:
	install -d $(APCPATH)/script
	install -d $(APCPATH)/local/etc
	install -t $(APCPATH)/script $(SCRIPTS) 
	install -t $(APCPATH)/local/etc subbasement.sh
	(cd serial; make install)
	(cd openmp; make install)
	(cd openmpi; make install)
	(cd intelmpi; make install)
	(cd upc; make install)

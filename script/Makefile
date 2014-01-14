
APCPATH=/share/cs-instructional/cs5220/
MPIPATH=$(APCPATH)/local/openmpi-1.6.5
UPCPATH=$(APCPATH)/local/upc

SCRIPTS=setup_ipython_htc.sh setup.sh vars.sh vars.csh

.PHONY: install
install:
	install -t $(APCPATH)/script $(SCRIPTS) 
	install -t $(MPIPATH)/etc openmpiscript
	install -t $(MPIPATH)/bin mpisub
	install -t $(UPCPATH)/etc upcscript
	install -t $(UPCPATH)/bin upcsub

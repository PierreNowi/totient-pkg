APCPATH=/share/cs-instructional/cs5220
MPIPATH=$(APCPATH)/intel/impi/4.1.1.036/intel64

.PHONY: install 

install:
	install -t $(MPIPATH)/etc intelmpiscript
	install -t $(MPIPATH)/bin mpisub
	install -t $(MPIPATH)/bin condor_impi_ssh

APCPATH=/share/cs-instructional/cs5220
MPIPATH=$(APCPATH)/local/openmpi-1.6.5

.PHONY: install

install:
	install -t $(MPIPATH)/etc openmpiscript
	install -t $(MPIPATH)/bin mpisub
	install -t $(MPIPATH)/bin mpihsub


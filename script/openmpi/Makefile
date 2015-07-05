APCPATH=$(HOME)
MPIPATH=$(APCPATH)/local/openmpi-1.8.6

.PHONY: install

install:
	install -t $(MPIPATH)/etc openmpiscript
	install -t $(MPIPATH)/bin mpisub
	install -t $(MPIPATH)/bin mpihsub


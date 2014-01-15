# Intel MPI on HTCondor

I started with `mp2script` (since both Intel MPI and MPICH have an MPD
launcher), but ran into trouble with `condor_chirp get_job_attr`, which
returns a zero status code even when the variable is not set.  After
many alternate attempts, I figured out that the Hydra process manager
can be used in a manner very similar to the ORTE process manager used
with OpenMPI.  This requires running with the Intel `mpiexec.hydra`,
but otherwise is not an issue.

An advantage to this approach is that the basic setup is almost identical
to the one we used with OpenMPI.

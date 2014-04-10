# Base for the CS 5220 submission scripts (csub, ompsub, mpisub, upcsub)
# Input: subname

done_parsing=false
default_reqs='requirements = (C4_GROUP == "cs") || (C4_GROUP == "cs-instructional")'
NP=1
hasa=""
hast=""
hasf=""

MAX_RUN_TIME=10

if [ $# -lt 1 ]; then
  echo "Usage: $subname [-n procs] [-a] [-t opts] [-T time] [-f script] exe args"
  echo "  -n -- determines number of processes to launch (default 1)"
  echo "  -a -- use whole cluster (vs just instructional nodes)"
  echo "  -t -- use TAU to profile"
  echo "  -T -- set maximum run time (default: 10 minutes)"
  echo "  -f -- specify additional HTCondor features"
  echo "  -d -- dry run (produce sub file, but do not submit)"
  exit 0
fi

while [ $done_parsing = "false" ]
do
done_parsing=true

if [ "$1" = "-n" ]; then
  shift
  NP=$1
  shift
  done_parsing=false
fi

if [ "$1" = "-a" ]; then
  shift
  hasa=true
  done_parsing=false
fi

if [ "$1" = "-t" ]; then
  shift
  hast="tau_exec $1"
  shift
  export TAU_VERBOSE=1
  export PROFILEDIR="."
  done_parsing=false
fi

if [ "$1" = "-T" ]; then
  shift
  MAX_RUN_TIME=$1
  shift
fi

if [ "$1" = "-f" ]; then
  shift
  hasf=$1
  shift
  done_parsing=false
fi

if [ "$1" = "-d" ]; then
  shift
  hasd=$1
  shift
  done_parsing=false
fi

done

APCPATH=/share/cs-instructional/cs5220
BASENAME=$subname-$$
SUBFILE=$BASENAME.sub

function split_nproc() {
  if echo $NP | grep "x" ; then
    NPROCESS=`echo $NP | sed 's/[0-9]*x\([0-9]*\)/\1/'`
    NPTHREAD=`echo $NP | sed 's/x[0-9]*//'`
  else
    NPROCESS=1
    NPTHREAD=$NP
  fi
  NTHREAD=$[ $NPROCESS * $NPTHREAD ]
  echo "Slots: $NPROCESS"
  echo "Processes per: $NPTHREAD"
  echo "Processes total: $NTHREAD"
}

function write_reqs() {
  if [ -z "$hasa" ]; then
    echo "$default_reqs" >> $SUBFILE
  fi
  if [ "$hasf" ]; then
    cat $hasf >> $SUBFILE
  fi
}

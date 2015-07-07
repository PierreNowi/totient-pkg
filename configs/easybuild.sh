source ./helper.sh
set_stage

EBPATH=$HOME/.local/easybuild

wgetl https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py
python bootstrap_eb.py $EBPATH

leave_stage

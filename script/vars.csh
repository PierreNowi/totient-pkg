# -- Load modules
source /etc/profile.d/modules.sh

# -- Add 5220 to path
setenv APCPATH=/share/cs-instructional/cs5220
setenv MODULEPATH=$MODULEPATH:$APCPATH/modules

module load cs5220-base
module load openmpi-1.6.5
module load gcc-4.8.2
module load openblas
module load lapack
module load sprng
module load tau

#module load gperftools
#module load ipm
#module load llvm
#module load anaconda
#module load upc
#module load julia

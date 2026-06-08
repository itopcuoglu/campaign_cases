#PBS -A wyom0218
#PBS -N abl_precursor
#PBS -q main
##PBS -q debug
#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=128:mpiprocs=20:ompthreads=1
#PBS -M itopcuog@uwyo.edu
#PBS -m bea

# Load modules to match compile-time environment
module purge
module load ncarenv/24.12  intel-oneapi/2024.2.1 cray-mpich/8.1.29

export KYNEMA_DIR=/glade/campaign/uwyo/wyom0218/topcuoglu/kynema-manager/
cd ${KYNEMA_DIR}
source shortcut.sh
quick-activate environments/kynema_hypre
spack load kynema-driver
cd -


mpiexec --cpu-bind depth -n 128 -ppn 128 -d 1 kynema_sgf  ./abl_precursor.inp &> abl_precursor.log

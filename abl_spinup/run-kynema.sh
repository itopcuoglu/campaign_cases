#PBS -A wyom0218
#PBS -N abl_spinup
#PBS -q main
##PBS -q debug
#PBS -l walltime=00:01:00
#PBS -l select=1:ncpus=4:mpiprocs=4:ompthreads=1
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


mpiexec --cpu-bind depth -n 4 -ppn 4 -d 1 kynema_sgf  ./abl_spinup.inp &> abl_spinup.log

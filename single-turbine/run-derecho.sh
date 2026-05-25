#PBS -A wyom0218
#PBS -N hybrid_job
#PBS -q main
#PBS -l walltime=01:00:00
#PBS -l select=10:ncpus=128:mpiprocs=128:ompthreads=1

# Load modules to match compile-time environment
module purge
#module load ncarenv/24.12 intel/2024.2.1 craype/2.7.23 cray-mpich/8.1.29
module load ncarenv/24.12  intel-oneapi/2024.2.1 cray-mpich/8.1.29

export EXAWIND_DIR=/glade/campaign/uwyo/wyom0218/topcuoglu/em_test/exawind-manager/
cd ${EXAWIND_DIR}
source shortcut.sh
quick-activate environments/exa3/
spack load exawind
cd -

# Run application with MPI binding helper script
#mpibind ./executable_name

# Or run application using cray-mpich with explicit binding
# mpiexec --cpu-bind depth -n 64 -ppn 32 -d 4 ./executable_name
mpiexec --cpu-bind depth -n 1280 -ppn 128 -d 1 exawind --awind 640 --nwind 640 ./nrel5mw.yaml
#mpiexec -n 1 -ppn 4 --awind 2 --nwind 2  exawind ctv1.yaml

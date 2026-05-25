#!/bin/bash
#SBATCH --job-name=test_job
#SBATCH --output=result.out
##SBATCH --partition=normal        # Partition name
#SBATCH --qos=normal
#SBATCH --nodes=20                 # Number of nodes
#SBATCH --ntasks-per-node=96       # Tasks per node
#SBATCH --cpus-per-task=1         # CPUs per task
#SBATCH --time=01:00:00           # Time limit hrs:min:sec
##SBATCH --mem=8gb                 # Memory requirement
#SBATCH -A turbmodel

# Load modules (if required)
# module load <software>





# Load modules to match compile-time environment
#module purge

export KYNEMA_DIR=/project/turbmodel/itopcuog/kynema-manager
cd ${KYNEMA_DIR}
source shortcut.sh
quick-activate environments/kynema_base
spack load kynema-driver
cd -

# Execute the application
#srun <command_or_executable>

#mpiexec --cpu-bind depth -n 1536 -ppn 128 -d 1 kynema_driver --kyenam_sgf 896 --kynema_ugf 640 ./nrel5mw.yaml &> nrel5mw.log
srun kynema_driver --sgf 1440 --ugf 480 nrel5mw.yaml &> nrel5mw.log
#srun kynema_sgf  nrel5mw_amr.inp &> nrel5mw_amr.log
#srun --nodes=10 --ntasks-per-node=96 --ntasks=960 kynema_driver --kynema_sgf 480 --kynema_ugf 480 nrel5mw.yaml &> nrel5mw.log




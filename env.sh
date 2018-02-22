source /mnt/software/Modules/current/init/bash
module purge
module load git

module load python/2.7.13-UCS${UCS}
#module load gcc/4.9.2
#module load ccache
#module load cmake
#module load boost
#module load zlib # IMPORTANT: Do NOT load this!
#module load hdf5-tools/1.8.16

#set -vex

PFHOME=/scratch/cdunn/fork
PREFIX=${PREFIX:-/scratch/cdunn/fork/.git/LOCAL${UCS}}
PYTHONUSERBASE=${PREFIX}
export PFHOME PREFIX PYTHONUSERBASE

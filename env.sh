source /mnt/software/Modules/current/init/bash
module purge
module load git
module load python/2.7.13-UCS${UCS}

#set -vex

# You should set PFHOME and UCS yourself.
PFHOME=${PFHOME:-/scratch/cdunn/fork}
PREFIX=${PFHOME}/.git/LOCAL${UCS}
PYTHONUSERBASE=${PREFIX}
export PFHOME PREFIX PYTHONUSERBASE

source /mnt/software/Modules/current/init/bash
module purge
module load git
module load python

set -vex

PFHOME=/scratch/cdunn/pitchfork
PREFIX=/scratch/cdunn/pf2
PYTHONUSERBASE=${PREFIX}
export PFHOME PREFIX PYTHONUSERBASE

source /mnt/software/Modules/current/init/bash
module load virtualenv
module load gcc/6.4.0

#python -c 'import pip; print pip' || python get-pip.py --user
set -vex

VENV=$(pwd)/.git/VENV
rm -rf ${VENV}
#virtualenv --no-setuptools --python=/opt/python-2.7.9/bin/python ${VENV}
source /mnt/software/Modules/current/init/bash
#module load python/2.7.13-UCS4
virtualenv --python=$(which python) ${VENV}
source ${VENV}/bin/activate
export LD_LIBRARY_PATH=${VENV}/lib:$LD_LIBRARY_PATH
tar xvfz /scratch/cdunn/foo${UCS}.tar.gz -C ${VENV}/

which fc_ovlp_stats
fc_ovlp_stats -h
which fc_unzip.py
which fc_phasing_readmap.py
fc_phasing_readmap.py -h
#which ldd # does not work from /mnt/software/g/gcc/4.9.2/libc-2.5/bin/ldd
#ldd --help
/usr/bin/ldd -r ${VENV}/bin/blasr
#module load gcc/4.9.2 # You might need to do this yourself.
python -c 'import falcon_kit; print falcon_kit'
python -c 'import ConsensusCore; print ConsensusCore'
python -c 'import ConsensusCore2; print ConsensusCore2'

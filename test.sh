#python -c 'import pip; print pip' || python get-pip.py --user
set -vex

VENV=$(pwd)/.git/VENV
rm -rf ${VENV}
virtualenv --no-setuptools --python=/opt/python-2.7.9/bin/python ${VENV}
source ${VENV}/bin/activate
export LD_LIBRARY_PATH=${VENV}/lib:$LD_LIBRARY_PATH
tar xvfz /scratch/cdunn/foo.tar.gz -C ${VENV}/
which fc_ovlp_stats
fc_ovlp_stats -h
#which ldd # does not work from /mnt/software/g/gcc/4.9.2/libc-2.5/bin/ldd
#ldd --help
/usr/bin/ldd -r ${VENV}/lib/libblasr.so

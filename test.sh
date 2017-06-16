#python -c 'import pip; print pip' || python get-pip.py --user

VENV=$(pwd)/.git/VENV
rm -rf ${VENV}
virtualenv --no-setuptools --python=/opt/python-2.7.9/bin/python ${VENV}
source ${VENV}/bin/activate
export LD_LIBRARY_PATH=${VENV}/lib:$LD_LIBRARY_PATH
tar xvfz /scratch/cdunn/foo.tar.gz -C ${VENV}/
which fc_ovlp_stats.py
fc_ovlp_stats.py -h

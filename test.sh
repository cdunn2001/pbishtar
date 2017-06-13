#python -c 'import pip; print pip' || python get-pip.py --user

VENV=$(pwd)/.git/VENV
rm -rf ${VENV}
virtualenv --python=/opt/python-2.7.9/bin/python ${VENV}
source ${VENV}/bin/activate

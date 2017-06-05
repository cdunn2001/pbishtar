# python -m pip install ... # in case pip is not in $PATH
PIP_INSTALL=python -m pip install -v ${FALCON_PIP_USER}
WHEEL_DIR=install-pip

${PIP_INSTALL} --use-wheel --no-index --find-links=${WHEEL_DIR} package_name

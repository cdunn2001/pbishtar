default:
	bash build-wheels.sh
install-pip:
	python -c 'import pip; print pip' || python get-pip.py ${FALCON_PIP_USER}

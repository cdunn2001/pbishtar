source env.sh

#tar -cf /scratch/cdunn/foo.tar -C ${PREFIX} --exclude=./etc --exclude=./include --exclude=./share --exclude=./src --exclude=./var --exclude=setup-env.sh .

READY_DIR=/scratch/cdunn/ipf
rm -rf ${READY_DIR}
rsync -av ${PREFIX}/bin ${PREFIX}/lib ${READY_DIR}/
tar -cf /scratch/cdunn/foo.tar -C ${READY_DIR} .

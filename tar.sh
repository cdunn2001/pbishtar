source env.sh

#tar -cf /scratch/cdunn/foo.tar -C ${PREFIX} --exclude=./etc --exclude=./include --exclude=./share --exclude=./src --exclude=./var --exclude=setup-env.sh .

PBISHTAR_DIR=$(pwd)
READY_DIR=/scratch/cdunn/ipf
rm -rf ${READY_DIR}
rsync -av ${PREFIX}/bin ${PREFIX}/lib ${READY_DIR}/
pushd ${READY_DIR}/bin
${PBISHTAR_DIR}/fix_shebang.py
cd ../lib
rm -f *.a
rm -rf libboost*
popd
tar -cf /scratch/cdunn/foo.tar -C ${READY_DIR} .
gzip /scratch/cdunn/foo.tar

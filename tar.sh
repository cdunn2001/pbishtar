source env.sh

#tar -cf /scratch/cdunn/foo.tar -C ${PREFIX} --exclude=./etc --exclude=./include --exclude=./share --exclude=./src --exclude=./var --exclude=setup-env.sh .

PBISHTAR_DIR=$(pwd)
READY_DIR=/scratch/cdunn/ipf
rm -rf ${READY_DIR}
rsync -av --delete ${PREFIX}/bin ${PREFIX}/lib ${READY_DIR}/
pushd ${READY_DIR}/bin
${PBISHTAR_DIR}/fix_shebang.py
cd ../lib
rm -f *.a
# Not needed if we build right, but cannot hurt:
rm -rf libboost*
cd ..
find . -name '*.png' | xargs rm -f
find . -name '*.jpg' | xargs rm -f
find . -name '*.svg' | xargs rm -f
find . -name '*.gif' | xargs rm -f
find . -name '*.pdf' | xargs rm -f
rm -rf lib/python2.7/site-packages/matplotlib/tests/
rm -rf lib/python2.7/site-packages/mpl_toolkits/tests/
#find lib/python2.7/site-packages/falcon_unzip -name '*.py'|xargs rm -f
popd
mkdir -p /scratch/cdunn/
tar -czf /scratch/cdunn/foo${UCS}.tar.gz -C ${READY_DIR} .
#gzip /scratch/cdunn/foo.tar

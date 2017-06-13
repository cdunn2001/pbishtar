source env.sh
NPROC=$(nproc)
cd ${PFHOME}
make init
make pip
make pypeFLOW
# make -j${NPROC} falcon_polish FALCON_unzip

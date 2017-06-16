source env.sh

export CCACHE_DIR=${PFHOME}/.git/ccache
#export CCACHE_DIR=$(pwd)/.git/ccache
export PIP_CACHE_DIR=${PFHOME}.git/pip
#export PIP_CACHE_DIR=$(pwd)/.git/pip
mkdir -p ${PREFIX}

NPROC=$(nproc)
cd ${PFHOME}
make init
make pip
make networkx
make -j${NPROC} falcon_polish FALCON_unzip

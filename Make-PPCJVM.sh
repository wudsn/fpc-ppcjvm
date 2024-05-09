# Run from bash, e.g. under Cygwin
# https://wiki.freepascal.org/FPC_JVM/Building

export REPOSITORY_FOLDER="$PWD/.."
export FPC_FOLDER="$REPOSITORY_FOLDER/fpc"
export FPC_PPCJVM_FOLDER="$REPOSITORY_FOLDER/fpc-ppcjvm"
export PATH="$FPC_FOLDER/compiler:$FPC_PPCJVM_FOLDER/build:$PATH"
pushd $FPC_FOLDER
make OPT="-gl" CROSSOPT="-O2 -gl" CPU_TARGET="jvm" OS_TARGET="java" INSTALL_PREFIX="out" all crossinstall
popd

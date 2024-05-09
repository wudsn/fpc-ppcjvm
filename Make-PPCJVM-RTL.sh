# Run from bash, e.g. under Cygwin
export REPOSITORY_FOLDER="/cygdrive/c/jac/system/Windows/Programming/Repositories"
export FPC_FOLDER="$REPOSITORY_FOLDER/fpc"
export FPC_PPCJVM_FOLDER="$REPOSITORY_FOLDER/fpc-ppcjvm"
export PATH="$FPC_FOLDER/compiler:$FPC_PPCJVM_FOLDER/build:$PATH"
export PP=ppcjvm
export CPU_TARGET=jvm
echo "Using '$PP' version $($PP -iV)"
pushd $FPC_FOLDER/rtl/java
make clean
make
popd

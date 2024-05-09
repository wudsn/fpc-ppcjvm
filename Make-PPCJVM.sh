# Run from bash, e.g. under Cygwin
# https://wiki.freepascal.org/FPC_JVM/Building
pushd ../fpc
make OPT="-gl" CROSSOPT="-O2 -gl" CPU_TARGET="jvm" OS_TARGET="java" INSTALL_PREFIX="C:\jac\system\Windows\Programming\Repositories\fpc\out" all crossinstall
popd

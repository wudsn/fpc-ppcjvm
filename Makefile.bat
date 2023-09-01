@echo off
setlocal
set TEST_FOLDER=%~dp0
set TARGET_FOLDER=%~dp0
set FPC_FOLDER=C:\jac\system\Windows\Programming\Repositories\fpc
set FPC_BIN_FOLDER=%FPC_FOLDER%\compiler
rem The build folder contains Jasmin and other Java tools
set FPC_BUILD_FOLDER=%FPC_FOLDER%\build
set PATH=%FPC_BIN_FOLDER%;%FPC_BUILD_FOLDER%;%PATH%

set FPC_UNITS_FOLDER=%FPC_FOLDER%\rtl\units
set FPC_RTL_INC_FOLDER=%FPC_FOLDER%\rtl\inc
set FPC_RTL_JAVA_FOLDER=%FPC_FOLDER%\rtl\java
set FPC_RTL_JVM_FOLDER=%FPC_FOLDER%\rtl\jvm

echo Using PPCJVM version 
ppcjvm -iV
echo Unit folder %FPC_UNIT_FOLDER%
rem dir /b %FPC_UNIT_FOLDER%\*.*

cd %TEST_FOLDER%

rem goto :fast
call :compile minimal minimal.pp 
if not "%ERROR%"=="" goto:eof

call :compile trange1 trange1.pp 
if not "%ERROR%"=="" goto:eof

:fast
call :compile mp mp.pas
if not "%ERROR%"=="" goto:eof

call :compile mads mads.pas
if not "%ERROR%"=="" goto:eof

goto :eof

rem
rem Compile <FILE_NAME> <SOURCE_FILE_NAME>
rem

:compile
set FILE_NAME=%1
set SOURCE_FILE_NAME=%2

set VERBOSE=h
set VERBOSE=0
set VERBOSE=i

pushd %FILE_NAME%

if exist *.exe del *.exe
if exist *.o del *.o
if exist *.ppu del *.ppu


set FPC_TARGET=i386-win32
rem goto :use_ppcjvm

rem
rem FPC
rem
:use_fpc
set COMPILER=C:\jac\system\Windows\Tools\PAS\FPC\bin\i386-win32\fpc.exe
echo INFO: Compiling %SOURCE_FILE_NAME% to %FILE_NAME%.exe for %FPC_TARGET% with %COMPILER%.

%COMPILER% -MDelphi -v%VERBOSE% -O3 %SOURCE_FILE_NAME%

rem
rem PPC
rem
:use_ppc
set COMPILER=ppc
set FPC_UNIT_FOLDER=%FPC_UNITS_FOLDER%\%FPC_TARGET%
set FPC_RTL_CONSOLE_FOLDER=%FPC_FOLDER%\packages\rtl-console\units\%FPC_TARGET% 

echo INFO: Compiling %SOURCE_FILE_NAME% to %FILE_NAME%.exe for %FPC_TARGET% with %COMPILER%.
%COMPILER% -MDelphi -v%VERBOSE% -O3 -Fu%FPC_UNIT_FOLDER% -Fu%FPC_RTL_CONSOLE_FOLDER%  %SOURCE_FILE_NAME%
if ERRORLEVEL 1 goto :ppc_error

rem
rem PPCJVM
rem
:use_ppcjvm
set FPC_TARGET=jvm-java
set COMPILER=ppcjvm

echo INFO: Compiling %SOURCE_FILE_NAME% to %FILE_NAME%.class for %FPC_TARGET% with %COMPILER%.
set FPC_UNIT_FOLDER=%FPC_UNITS_FOLDER%\%FPC_TARGET%

%COMPILER% -mDelphi -v%VERBOSE% -Fu%FPC_UNIT_FOLDER% -Fi%FPC_RTL_INC_FOLDER% -Fi%FPC_RTL_JAVA_FOLDER% -Fi%FPC_RTL_JVM_FOLDER% -O2 -g %SOURCE_FILE_NAME%
if ERRORLEVEL 1 goto :ppc_error
java -cp ".;%FPC_UNIT_FOLDER%" %FILE_NAME%
echo Execution completed.
popd
goto :eof

:ppc_error
set ERROR=1
popd
goto :eof

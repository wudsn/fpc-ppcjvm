@echo off
rem setlocal
set TEST_FOLDER=%~dp0
set TARGET_FOLDER=%~dp0
set REPOSITORIES_FOLDER=C:\jac\system\Windows\Programming\Repositories
set FPC_FOLDER=%REPOSITORIES_FOLDER%\fpc
set FPC_BIN_FOLDER=%FPC_FOLDER%\compiler

rem The build folder contains Jasmin and other Java tools
set FPC_PPCJVM_FOLDER=%REPOSITORIES_FOLDER%\fpc-ppcjvm
set FPC_BUILD_FOLDER=%FPC_PPCJVM_FOLDER%\build
set PATH=%FPC_BIN_FOLDER%;%FPC_BUILD_FOLDER%;%PATH%

set FPC_UNITS_FOLDER=%FPC_FOLDER%\rtl\units
set FPC_RTL_INC_FOLDER=%FPC_FOLDER%\rtl\inc
set FPC_RTL_JAVA_FOLDER=%FPC_FOLDER%\rtl\java
set FPC_RTL_JVM_FOLDER=%FPC_FOLDER%\rtl\jvm

ppc386 -h >ppc386-options.txt
ppcjvm -h >ppcjvm-options.txt

echo Unit folder %FPC_UNITS_FOLDER%
rem dir /b %FPC_UNIT_FOLDER%\*.*

cd %TEST_FOLDER%

rem goto :fast
call :compile hello hello.pp 
if not "%ERROR%"=="" goto:eof

call :compile minimal minimal.pp 
if not "%ERROR%"=="" goto:eof

call :compile trange1 trange1.pp 
if not "%ERROR%"=="" goto:eof

:fast
call :compile mp mp.pas
if not "%ERROR%"=="" goto:eof

rem call :compile mp mp-stripped.pas
rem if not "%ERROR%"=="" goto:eof

call :compile mads mads.pas
if not "%ERROR%"=="" goto:eof

goto :eof

rem
rem Compile <FILE_NAME> <SOURCE_FILE_NAME>
rem

:compile
set FILE_NAME=%1
set SOURCE_FILE_NAME=%2

echo Compiling %SOURCE_FILE_NAME% to %FILE_NAME%.

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
echo.
echo ### FPC ###
set COMPILER=C:\jac\system\Windows\Tools\PAS\FPC\bin\i386-win32\fpc.exe
echo | set /P="INFO: Compiling %SOURCE_FILE_NAME% to %FILE_NAME%.exe for %FPC_TARGET% with %COMPILER% version "
%COMPILER% -iV

%COMPILER% -MDelphi -v%VERBOSE% -O3 %SOURCE_FILE_NAME%
%FILE_NAME%.exe

rem
rem PPC386
rem
:use_ppc386
echo.
echo ### PPC386 ####
set COMPILER=ppc386
set FPC_UNIT_FOLDER=%FPC_UNITS_FOLDER%\%FPC_TARGET%
set FPC_RTL_CONSOLE_FOLDER=%FPC_FOLDER%\packages\rtl-console\units\%FPC_TARGET% 

echo | set /P="INFO: Compiling %SOURCE_FILE_NAME% to %FILE_NAME%.exe for %FPC_TARGET% with %COMPILER% version "
%COMPILER% -iV
 
%COMPILER% -MDelphi -v%VERBOSE% -O3 -Fu%FPC_UNIT_FOLDER% -Fu%FPC_RTL_CONSOLE_FOLDER%  %SOURCE_FILE_NAME%
if ERRORLEVEL 1 goto :ppc_error
%FILE_NAME%.exe

rem
rem PPCJVM
rem
:use_ppcjvm
echo.
echo ### PPCJVM ###
set FPC_TARGET=jvm-java
set COMPILER=ppcjvm

echo | set /P="INFO: Compiling %SOURCE_FILE_NAME% to %FILE_NAME%.exe for %FPC_TARGET% with %COMPILER% version "
%COMPILER% -iV
set FPC_UNIT_FOLDER=%FPC_UNITS_FOLDER%\%FPC_TARGET%

echo Unitfolder is "%FPC_UNIT_FOLDER%".
%COMPILER% -mDelphi -v%VERBOSE% -Fu%FPC_UNIT_FOLDER% -Fi%FPC_RTL_INC_FOLDER% -Fi%FPC_RTL_JAVA_FOLDER% -Fi%FPC_RTL_JVM_FOLDER% -O2 -g %SOURCE_FILE_NAME%
if ERRORLEVEL 1 goto :ppc_error
java -cp ".\%FILE_NAME%\;%FPC_UNIT_FOLDER%" %FILE_NAME%
echo Execution completed.
popd
goto :eof

:ppc_error
set ERROR=1
popd
goto :eof

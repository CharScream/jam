@echo off

pushd ..\src\external\emsdk

call emsdk_env.bat
call emsdk update 
call emsdk install latest 
call emsdk activate latest
 
popd


@echo off

if not exist build mkdir build
pushd build

if not exist web mkdir web
popd

pushd scripts

call emcc-build-raylib.bat 
call emcc-build.bat

popd
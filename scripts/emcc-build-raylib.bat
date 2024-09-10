@echo off

WHERE /Q emsdk
IF ERRORLEVEL 1 call emsdk_setup.bat

if not exist ..\build\web\obj mkdir ..\build\web\obj
pushd ..\build\web\obj

if exist libraylib.a popd && exit /b

set raylibsrc=..\..\..\src\external\raylib\src\

call emcc -c %raylibsrc%rcore.c -Os -Wall -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
call emcc -c %raylibsrc%rshapes.c -Os -Wall -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
call emcc -c %raylibsrc%rtextures.c -Os -Wall -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
call emcc -c %raylibsrc%rtext.c -Os -Wall -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
call emcc -c %raylibsrc%rmodels.c -Os -Wall -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
call emcc -c %raylibsrc%utils.c -Os -Wall -DPLATFORM_WEB
call emcc -c %raylibsrc%raudio.c -Os -Wall -DPLATFORM_WEB

call emar rcs libraylib.a rcore.o rshapes.o rtextures.o rtext.o rmodels.o utils.o raudio.o

popd

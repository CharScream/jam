@echo off

WHERE /Q emsdk
IF ERRORLEVEL 1 call emsdk_setup.bat


if not exist ..\build\web\bin mkdir ..\build\web\bin
pushd ..\build\web\bin

set raylibsrc=..\..\..\src\external\raylib\src\

call emcc -o game.html ..\..\..\src\web_main.c -Os -Wall ..\obj\libraylib.a -I..\..\..\src\external -I%raylibsrc% -I..\..\..\src\emsdk\upstream\emscripten\cache\sysroot\include\emscripten -L..\obj\. -L..\obj\libraylib.a -s USE_GLFW=3 --shell-file %raylibsrc%minshell.html -DPLATFORM_WEB

popd 


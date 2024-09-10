@echo off

if exist ..\build\windows\bin\raylib.dll exit /b

set raylibdir=..\..\..\src\external\raylib\src\

set LIBRARIES=kernel32.lib user32.lib shell32.lib winmm.lib gdi32.lib opengl32.lib
set RAYLIB=%raylibdir%rcore.c %raylibdir%rmodels.c %raylibdir%raudio.c %raylibdir%rglfw.c %raylibdir%rshapes.c %raylibdir%rtext.c %raylibdir%rtextures.c %raylibdir%utils.c -I%raylibdir%\external\glfw\include
set RAYLIB_DEFINES=/DBUILD_LIBTYPE_SHARED /DPLATFORM_DESKTOP

call msvc_upgrade_cmd_64.bat

if not exist ..\build\windows mkdir ..\build\windows
pushd ..\build\windows
if not exist obj mkdir obj
if not exist bin mkdir bin
pushd obj

:: lmao
windres %raylibdir%raylib.dll.rc -O coff -o %raylibdir%raylib.dll.rc.data --target=pe-x86-64

cl /LD %RAYLIB_DEFINES%  /Fe: "raylib" %RAYLIB% /link %LIBRARIES%

mv raylib.dll ..\bin
mv raylib.lib ..\bin

popd
popd

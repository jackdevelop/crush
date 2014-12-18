@echo off

SET CUR_DIR=%~dp0

SET EXE_DIR=%CUR_DIR%\bin\crush.exe
SET WORK_DIR=%CUR_DIR%
SET FILE=%CUR_DIR%\scripts\main.lua
SET SIZE=640x960

START /B %EXE_DIR% -workdir %WORK_DIR% -file %FILE% -size %SIZE%
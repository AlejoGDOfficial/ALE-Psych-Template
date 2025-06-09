@echo off
color 0b

title Compile the Clean Psych Source Code

echo Compiling...

:run_command
lime test windows

choice /c YN /m "Retry?"

if errorlevel 2 (
    exit
) else (
    goto run_command
)

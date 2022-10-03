@echo off
dir /b *.md /s 2> nul | find "" /v /c > tmp && set /p count=<tmp && del tmp && echo %count%
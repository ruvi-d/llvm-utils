@ECHO OFF
SETLOCAL EnableExtensions EnableDelayedExpansion

SET "EXIT_ON_ERROR=%~1"
SET SUCCESS=0

PUSHD %~dp0


SET VCT_PATH=%ProgramFiles(x86)%\Microsoft Visual Studio\2019\BuildTools\MSBuild\Microsoft\VC\v160\Platforms
IF EXIST "!VCT_PATH!" CALL :SUB_VS2019 "!VCT_PATH!"


IF %SUCCESS% == 0 (
	ECHO Visual C++ 2017 or 2019 NOT Installed.
	IF "%EXIT_ON_ERROR%" == "" PAUSE
)

POPD
ENDLOCAL
EXIT /B


:SUB_VS2019
ECHO VCTargetsPath for Visual Studio 2019: %~1
XCOPY /Q /Y "LLVM" "%~1\..\LLVM\"
XCOPY /Q /Y "LLVM_v142" "%~1\x64\PlatformToolsets\LLVM_v142\"
XCOPY /Q /Y "LLVM_v142" "%~1\Win32\PlatformToolsets\LLVM_v142\"
XCOPY /Q /Y "LLVM_v142" "%~1\ARM64\PlatformToolsets\LLVM_v142\"
XCOPY /Q /Y "LLVM_v142" "%~1\ARM\PlatformToolsets\LLVM_v142\"
SET SUCCESS=1
EXIT /B

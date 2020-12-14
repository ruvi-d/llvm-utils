@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

SET "EXIT_ON_ERROR=%~1"
SET SUCCESS=0

PUSHD %~dp0

@rem Visual Studio 2012
SET VCT_PATH=%ProgramFiles(x86)%\MSBuild\Microsoft.Cpp\v4.0\v110\Platforms
IF EXIST "%VCT_PATH%" CALL :SUB_VS2012
SET VCT_PATH=%ProgramFiles%\MSBuild\Microsoft.Cpp\v4.0\v110\Platforms
IF EXIST "%VCT_PATH%" CALL :SUB_VS2012

IF %SUCCESS% == 0 (
	ECHO Visual C++ 2012 NOT Installed.
	IF "%EXIT_ON_ERROR%" == "" PAUSE
)

POPD
ENDLOCAL
EXIT /B

:SUB_VS2012
ECHO VCTargetsPath for Visual Studio 2012: %VCT_PATH%
XCOPY /Q /Y "LLVM" "%VCT_PATH%\..\LLVM\"
XCOPY /Q /Y "x64\LLVM_v110" "%VCT_PATH%\x64\PlatformToolsets\LLVM_v110\"
XCOPY /Q /Y "x64\LLVM_v110_xp" "%VCT_PATH%\x64\PlatformToolsets\LLVM_v110_xp\"
XCOPY /Q /Y "Win32\LLVM_v110" "%VCT_PATH%\Win32\PlatformToolsets\LLVM_v110\"
XCOPY /Q /Y "Win32\LLVM_v110_xp" "%VCT_PATH%\Win32\PlatformToolsets\LLVM_v110_xp\"
SET SUCCESS=1
EXIT /B

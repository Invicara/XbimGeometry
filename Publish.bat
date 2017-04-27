rm -rf packages

nuget restore "Xbim.Geometry.Nuget.sln"
sleep 2
nuget restore "Xbim.Geometry.Nuget.sln"

set buildConfig="%~1"
if "%~1" == "" set buildConfig="Release|Any CPU"

"%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" "Xbim.Geometry.Nuget.sln" /clean %buildConfig%
"%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" "Xbim.Geometry.Nuget.sln" /build %buildConfig%

nuget pack Xbim.Geometry.Nuspec
copy *.nupkg ..\LocalPackages
del *.nupkg

rm -rf packages

nuget restore "Xbim.Geometry.Nuget.sln"
sleep 2
nuget restore "Xbim.Geometry.Nuget.sln"

set cputype=%~1
if "%~1" == "" set cputype=x64

"%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" "Xbim.Geometry.Nuget.sln" /build "ReleaseWithPDB|%cputype%"
nuget pack Xbim.Geometry.Nuspec

copy *.nupkg ..\LocalPackages
del *.nupkg

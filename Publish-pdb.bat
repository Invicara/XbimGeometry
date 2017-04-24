rm -rf packages

nuget restore "Xbim.Geometry.Nuget.sln"
sleep 2
nuget restore "Xbim.Geometry.Nuget.sln"

"%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" "Xbim.Geometry.Nuget.sln" /build "ReleaseWithPDB|Any CPU"
nuget pack Xbim.Geometry.Nuspec

copy *.nupkg ..\LocalPackages
del *.nupkg

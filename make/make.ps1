param ([string] $SpecName)

$BasePath = $PSScriptRoot

New-Item -ItemType Directory -Force -Path $BASEPATH/../src/$SPECNAME

docker run `
       -it `
       -v ${BasePath}/../src/${SpecName}:/opt/builder/in `
       -v ${BasePath}/../rpm/${SpecName}:/opt/builder/out `
       lifepainspace/rpm-builder:latest

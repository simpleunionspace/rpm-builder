param ([string] $SpecName)

$BasePath = $PSScriptRoot

docker run `
       -it `
       -v ${BasePath}/../src/${SpecName}:/opt/builder/in `
       -v ${BasePath}/../rpm/${SpecName}:/opt/builder/out `
       lifepainspace/rpm-builder:latest

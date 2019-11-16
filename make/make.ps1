$BasePath = $PSScriptRoot

docker build `
       --pull `
       --no-cache `
       --tag lifepainspace/rpm-builder:$(Get-date -Format yyyyMMdd.HHmm) `
       --tag lifepainspace/rpm-builder:latest `
       ${BasePath}/../src/

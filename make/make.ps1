${BasePath} = ${PSScriptRoot}

${DockerImages} = docker images -q lifepainspace/rpm-builder
foreach (${DockerImage} in ${DockerImages}) {
    docker rmi -f ${DockerImage}
}

docker build `
       --pull `
       --no-cache `
       --tag lifepainspace/rpm-builder:$(Get-date -Format yyyyMMdd.HHmm) `
       --tag lifepainspace/rpm-builder:latest `
       ${BasePath}/../src/

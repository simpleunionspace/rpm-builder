# rpm-builder

RPM builder. Based on CentOS 8.

## Table of contents

- [Input data](#input_data)
    - [Structure](#input_data_structure)
- [Steps](#steps)
    - [Prepare builder](#steps_prepare_builder)
    - [Prepare environment](#steps_prepare_environment)
    - [Prepare spec-file](#steps_prepare_spec)
    - [Build](#steps_build)
- [Output data](#output_data)
    - [Structure](#output_data_structure)

## Input data <a name="input_data"></a>

Container provide volume /opt/builder/in.

### Structure <a name="input_data_structure"></a>

```bash
/
├── src                  # artifacts
├── rpm.d.sources        # directory with rpm packages
├── tar.d.sources        # directory with tar files
├── zip.d.sources        # directory with zip files
├── yum.sources          # file with names of rpm packages
├── rpm.sources          # file with links to rpm packages
├── tar.sources          # file with links to tar files
├── zip.sources          # file with links to zip files
├── git.sources          # file with links to git repositories
├── mercurial.sources    # file with links to mercurial repositories
└── subversion.sources   # file with links to subversion repositories
```

## Steps <a name="steps"></a>

### Prepare builder <a name="steps_prepare_builder"></a>

Create directory structure, copy sources files (spec, artifacts) to builder directory.

### Prepare environment <a name="steps_prepare_environment"></a>

* yum

  Download and install yum packages from 'yum.sources' file.

* rpm

  Download and install rpm packages:
  * from 'rpm.sources' file
  * from 'rpm.d.sources' directory

* tar

  Download and extract tar files:
  * from 'tar.source' file
  * from 'tar.d.sources' directory

* zip

  Download and extract tar files:
  * from 'zip.source' file
  * from 'zip.d.sources' directory

* git

  Clone git repositories with submodules from 'git.sources' file.

* mercurial

  Clone mercurial repositories from 'mercurial.sources' file.

* subversion

  Checkout subversion repositories from 'subversion.sources' file.

### Prepare spec-file <a name="steps_prepare_spec"></a>

Executing spectool.

### Build <a name="steps_build"></a>

Executing rpmbuild.

## Output data <a name="output_data"></a>

Container provide volume /opt/builder/out.

### Structure <a name="output_data_structure"></a>

Output directory repeats RPMS directory structure of rpmbuild.

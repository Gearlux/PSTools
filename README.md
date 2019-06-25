# PSTools

This repository contains some utility scripts to manage the installation of jupyter notebooks for python experiments.

The idea is to use these files as a remote repository and use them to install all the packages.

```
$ mkdir scripts
$ git submodule add https://github.com/Gearlux/PSTools.git
```

To clone your repository use
```
$ git clone --recurse-submodules <your repo> 
$ git submodule update --remote
```

# Mixing Conda and Pip packages

I find it easy to use conda packages to use eg. tensorflow since it also installs cuda/cudnn libraries. Because conda does not include all packages, I have create the condatools module.

You can call 
```
Import-Module condatools.psm1
CondaInstall gym
```
to install OpenAI's gym with pip while most dependencies of gym will be installed with conda.

Similar call
```
CondaRequirements
```
to install a list of requirements with conda.

# Related
https://github.com/Liquidmantis/PSCondaEnvs

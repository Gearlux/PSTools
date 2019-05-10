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
#!/bin/sh
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source $dir/../venv/bin/activate
cd $dir/../python
jupyter notebook

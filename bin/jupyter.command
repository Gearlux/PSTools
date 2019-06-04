#!/bin/sh
source ~/.bash_profile
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
# source $dir/../venv/bin/activate
conda activate ptc
cd $dir/../python
jupyter notebook 

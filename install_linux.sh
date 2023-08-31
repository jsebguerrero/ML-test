#!/bin/bash

# Miniconda installation (Linux)
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
echo "conda activate base" >> ~/.bashrc

# Create a Conda environment and install packages
conda create -n myenv python=3.8
conda activate myenv
conda install --file requirements.txt

# Deactivate the environment
conda deactivate

#!/bin/bash

# Check the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
  # Windows (Git Bash or Cygwin)
  MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe"
else
  echo "Unsupported operating system"
  exit 1
fi

# Download and install Miniconda
echo "Downloading and installing Miniconda..."
curl -O $MINICONDA_URL
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
  export PATH="$HOME/miniconda/bin:$PATH"
elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
  Miniconda3-latest-Windows-x86_64.exe /S /D=%UserProfile%\Miniconda3
  export PATH=%UserProfile%\Miniconda3\Scripts;%UserProfile%\Miniconda3;%PATH%
  call conda init
fi

# Create and activate the 'testML' Conda environment with Python 3.8
echo "Creating 'testML' environment with Python 3.8..."
conda create -n testML python=3.8 -y
conda activate testML

# Install packages from requirements.txt
echo "Installing packages from requirements.txt..."
conda install --file requirements.txt -y

# Deactivate the environment
conda deactivate

echo "Installation completed."

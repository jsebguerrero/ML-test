@echo off

:: Miniconda installation (Windows)
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe -o Miniconda3.exe
start /wait Miniconda3.exe /S /D=%UserProfile%\Miniconda3
set PATH=%UserProfile%\Miniconda3\Scripts;%UserProfile%\Miniconda3;%PATH%
call conda init

:: Create a Conda environment and install packages
conda create -n myenv python=3.8
conda activate myenv
conda install --file requirements.txt

:: Deactivate the environment
conda deactivate

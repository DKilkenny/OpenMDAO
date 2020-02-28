#! /bin/sh

PY=3.6



echo "Building python environment";
echo "Installing conda";
echo "Downloading miniconda";
sudo apt-get install wget;
wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O miniconda.sh;
chmod +x miniconda.sh;
echo "  > Installing miniconda";
./miniconda.sh -b  -p $HOME/miniconda;
export PATH=$HOME/miniconda/bin:$PATH;
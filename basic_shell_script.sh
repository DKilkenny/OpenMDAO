#!/bin/bash

PY=3.6
NUMPY=1.16
SCIPY=1.2
PETSc=3.10.1

echo "Building python environment";
echo "Installing conda";
echo "Downloading miniconda";
wget "https://repo.anaconda.com/miniconda/Miniconda${PY:0:1}-latest-Linux-x86_64.sh" -O miniconda.sh;
chmod +x miniconda.sh;
echo "Installing miniconda";
./miniconda.sh -b  -p $HOME/miniconda;
export PATH=$HOME/miniconda/bin:$PATH;

echo " >> Creating conda environment";
conda create --yes -n PY$PY python=$PY;
source $HOME/miniconda/bin/activate PY$PY;

echo " >> Installing non-pure Python dependencies from conda";
conda install --yes numpy=$NUMPY scipy=$SCIPY cython swig;

pip install --upgrade pip;

echo " >> Installing forked python packages";
pip install git+https://github.com/swryan/coveralls-python@work;

echo " >> Installing pyOptSparse";
echo "  > Cloning pyOptSparse from mdolab";
git clone https://github.com/mdolab/pyoptsparse.git;
cd pyoptsparse;
git checkout tags/v1.2 -b branchname;

if [ "$SNOPT_LOCATION" ] && [ "${PY:0:1}" = "3" ]; then
    cd pyoptsparse/pySNOPT;
    ls;
fi
# echo "Secure copying SNOPT over SSH";
# scp -r "$SNOPT_LOCATION" .;
# cd ../..;

echo "FINISHED DOCKER BUILD";
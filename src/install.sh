# Constants
HOME=/home/condauser
BASH_RC=/home/condauser/.bashrc
PREFIX=/home/condauser/anaconda3

PY3PATH=$PREFIX/bin

# python 3
CONDA3=$PY3PATH/conda
PIP3=$PY3PATH/pip

# Install and remove file
bash $HOME/Anaconda.sh -b

# make anaconda's python default for our user
echo "
# added by Anaconda-Notebook
export PATH=\"$PY3PATH:\$PATH\"" >> $BASH_RC

# additional packages to install
$CONDA3 install --yes seaborn
$PIP3 install credis
$PIP3 install python-Levenshtein
$PIP3 install fuzzywuzzy
$PIP3 install tldextract



# ipython setup
$PY3PATH/ipython profile create default --ipython-dir $HOME/.ipython
chown condauser:condauser $HOME/.ipython/profile_default/security -R
mkdir $HOME/notebooks
cp -a /tmp/notebooks $HOME/notebooks

# cleanup
rm -rf $HOME/Anaconda.sh
rm -rf $HOME/temp

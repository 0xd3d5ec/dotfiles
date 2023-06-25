#!/bin/bash

# Install dependencies
sudo pacman -Syu base-devel openssl zlib

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
exec $SHELL

# Install Python versions
pyenv install 3.9.6

# Set global Python version
pyenv global 3.9.6

# Set local Python version (optional)
# cd /path/to/project/directory
# pyenv local 3.9.6

# Verify Python versions
pyenv versions
python --version

# Update pyenv
cd ~/.pyenv
git pull

#!/bin/bash

# Define the Python version you want to install
PYTHON_VERSION="3.10"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew could not be found, installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "Homebrew installed successfully."
else
    echo "Homebrew is already installed."
fi

# Update Homebrew to ensure we have the latest package information
echo "Updating Homebrew..."
brew update

# Install Python 3.10 using Homebrew
echo "Installing Python $PYTHON_VERSION..."
brew install python@$PYTHON_VERSION

# Create a virtual environment in the current directory
VENV_DIR="$HOME/venv"
echo "Creating virtual environment in $VENV_DIR..."
python3.10 -m venv $VENV_DIR

# Activate the virtual environment
echo "Activating virtual environment..."
source $VENV_DIR/bin/activate

# Upgrade pip to the latest version
echo "Upgrading pip..."
pip install --upgrade pip

# Confirm the installation
echo "Python version in the virtual environment:"
python --version

echo "Pip version in the virtual environment:"
pip --version

echo "Virtual environment setup is complete."
echo "To activate the environment in the future, use: source $VENV_DIR/bin/activate"

# Copy .bashrc and .bash_profile to the home directory
echo "Copying .bashrc and .bash_profile to the home directory..."
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
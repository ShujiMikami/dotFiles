#************* .profile setting overview ***********************"
#Tools and package management : Homebrew"
#***************************************************************"

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
eval "$(pyenv init -)"

#Add compiledb dir to PATH
export PATH=$PATH:~/.cache/c++_python/.venv/bin

#Add nodebrew dir to PATH
export PATH=$PATH:$HOME/.nodebrew/current/bin

# Add linuxbrew to PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#************* .profile setting overview ***********************"
#Tools and package management : Homebrew"
#***************************************************************"

#Add compiledb dir to PATH
export PATH=~/.cache/c++_python/.venv/bin:$PATH

#Add nodebrew dir to PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Add linuxbrew to PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

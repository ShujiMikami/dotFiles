if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f /Users/shuji/dotFiles/.cache/Profiles/.profile_python ] ; then source /Users/shuji/dotFiles/.cache/Profiles/.profile_python ; fi #pyenv path settings
if [ -f /Users/shuji/dotFiles/.cache/Profiles/.profile_neovim ] ; then source /Users/shuji/dotFiles/.cache/Profiles/.profile_neovim ; fi #neovim path settings
export PATH=$PATH:$HOME/dotFiles/c_cpp/c_cpp-python3/.venv/bin
export PATH=$HOME/dotFiles/.cache/Applications/openocd/xpack-openocd-0.11.0-1/bin:$PATH
export PATH=$HOME/dotFiles/.cache/Applications/openocd/xpack-openocd-0.11.0-1/scripts:$PATH

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f /Users/shuji/dotFiles/.cache/Profiles/.profile_python ] ; then source /Users/shuji/dotFiles/.cache/Profiles/.profile_python ; fi #pyenv path settings
if [ -f /Users/shuji/dotFiles/.cache/Profiles/.profile_neovim ] ; then source /Users/shuji/dotFiles/.cache/Profiles/.profile_neovim ; fi #neovim path settings
export DOTFILES_ROOT=$HOME/dotFiles

# arm-none-eabi-tools
export ARM_NONE_EABI_TOOLS_ROOT=$DOTFILES_ROOT/.cache/Applications/arm-none-eabi-tools/gcc-arm-none-eabi-10-2020-q4-major
export PATH=$ARM_NONE_EABI_TOOLS_ROOT/bin:$PATH

# openocd
export OPEN_OCD_ROOT=$DOTFILES_ROOT/.cache/Applications/openocd/xpack-openocd-0.11.0-1
export PATH=$OPEN_OCD_ROOT/bin:$PATH

# neovim
export NEOVIM_ROOT=$DOTFILES_ROOT/.cache/Applications/neovim/nvim-osx64
export PATH=$NEOVIM_ROOT/bin:$PATH

# LLVM
export LLVM_ROOT=$DOTFILES_ROOT/.cache/Applications/llvm/clang+llvm-12.0.0-x86-64-apple-darwin
export PATH=$LLVM_ROOT/bin:$PATH

# TexLab
export TEXLAB_ROOT=$DOTFILES_ROOT/.cache/Applications/texlab
export PATH=$TEXLAB_ROOT:$PATH

export PATH=$PATH:$HOME/dotFiles/c_cpp/c_cpp-python3/.venv/bin

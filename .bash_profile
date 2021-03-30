if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#pyenv path settings
if [ -f /Users/shuji/dotFiles/.cache/.profile_python ] ; then
  source /Users/shuji/dotFiles/.cache/.profile_python
fi

#neovim path settings
if [ -f /Users/shuji/dotFiles/.cache/.profile_neovim ] ; then
  source /Users/shuji/dotFiles/.cache/.profile_neovim
fi

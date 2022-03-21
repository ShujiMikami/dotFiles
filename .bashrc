# Alias ls as ls with option -AF --color=auto
alias ls='ls -AF --color=auto'

# Alias ll as ls with option -AlFh --color=auto"
alias ll='ls -AlFh --color=auto'

if [ "$(uname)" == 'Darwin' ]; then
  # For Mac OSX only setting
  # Set color for directory as (fore, back) = (bold green default)
  # Set color for symbolic link as (fore, back) = (cyan default)
  export LSCOLORS=Cxgxcxdxbxegedabagacad
fi

# Set prompt as <gray back> User@Host <green back> Current directory $
export PS1="\[\e[30;47m\] \u@\h \[\e[1;30;42m\] \W \[\e[0m\] \$ "

if [ "$(uname)" == 'Linux' ]; then
  # For Linux only setting
  # Set Japanese indicate of home directories to English
  if [ -e ~/ダウンロード ]; then
    LANG=C xdg-user-dirs-gtk-update
  fi
fi

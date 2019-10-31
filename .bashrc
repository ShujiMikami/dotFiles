if [ $UID -eq 0 ]; then
	PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
	PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi

alias ls='ls -FG'
alias ll='ls -alFG'
alias vi='vim'

if [ "$HOSTNAME" = MacBookAir ]; then
  echo "MacBookAir setting"
  alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
  export PATH=$PATH:/Applications
  export PATH=$PATH:$HOME/.pyenv/shims
  eval "$(pyenv init -)"
fi

if [ "$HOSTNAME" = ydmdtn005 ]; then
  echo "ydmdtn005 setting"
  sudo mount -t cifs //m5fsv01.murata.co.jp/sdc /mnt/Drive_L -o username=mm07860,uid=1000,gid=1000
fi

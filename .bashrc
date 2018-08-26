if [ $UID -eq 0 ]; then
	PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
	PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi

alias ls='ls -FG'
alias ll='ls -alFG'

export PATH=$PATH:/Applications
export PATH=$PATH:$HOME/.pyenv/shims
eval "$(pyenv init -)"

if [ $UID -eq 0 ]; then
	PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
	PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi

alias ls='ls -FG'
alias ll='ls -alFG'
alias vi='vim'
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

export PATH=$PATH:/Applications
export PATH=$PATH:$HOME/.pyenv/shims
eval "$(pyenv init -)"

export PATH=$PATH:/usr/local/Cellar/llvm/bin
export PATH=$PATH:$HOME/.platformio/penv/bin
export PATH=$PATH:$HOME/cquery/build/release/bin

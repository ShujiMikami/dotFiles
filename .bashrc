if [ $UID -eq 0 ]; then
	PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
	PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi

alias ls='ls -FG'
alias ll='ls -alFG'

#vimコマンドを作成
alias vi='vim'

if [ "`uname`" == "Darwin" ]; then
  #MacOS用設定

  #ApplicationsをPATHに追加
  export PATH=$PATH:/Applications
  
  #MacVimが入っていれば, こちらをalias起動する
  if [ -e /Applications/MacVim.app/Contents/MacOS/Vim ]; then
    alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
  fi

  #llvmが入っていればこれをPathに追加する
  if [ -e /usr/local/Cellar/llvm/bin ]; then
    export PATH=$PATH:/usr/local/Cellar/llvm/bin
  fi

  #pyenvが入っていればこれをPathに追加し, pyenvのpythonのバージョンにする
  if [ -e $HOME/.pyenv/shims ]; then
    export PATH=$PATH:$HOME/.pyenv/shims
    eval "$(pyenv init -)"
  fi
elif [ "`uname`" == "Linux" ]; then
  #Linux用設定
fi

  



# command LINE
alias LINE='open -a "LINE"'

# command vi and vim
export EDITOR=/Applications/MacVim/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# command google
function google(){
if [ $# -ne 0 ]; then
 local _url="http://www.google.co.jp/search?q=$1"
 shift

 while [ $# -ne 0 ]
 do
  _url="$_url+$1"
  shift
 done

else
 return 1
fi
open ${_url}
}

#command STM32CubeMX
function STM32CubeMX(){
java -jar /Applications/STM32CubeMX/STM32CubeMX.exe
}

#lsの色付けとスラッシュ付け
alias ls='ls -FG'
alias ll='ls -alFG'

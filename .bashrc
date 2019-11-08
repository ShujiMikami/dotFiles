function source_file {
  if [ $# -lt 1 ];then
    echo "ERROR!!! source_file is called w/o an argument"
    return
  fi
  arg="$1"
  shift
  if [ -r "$arg" ]; then
    source "$arg"
  fi
}

if [ $UID -eq 0 ]; then
	PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
	PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi

alias ls='ls -FG'
alias ll='ls -alFG'
alias vi='vim'

#Office Linux Desktop
[[ "$HOSTNAME" =~ ydmdtn005 ]] && source_file ~/dotFiles/.bashrc_ydmdtn005

#Office Raspberry Pi
[[ "$HOSTNAME" =~ ydmpc901 ]] && source_file ~/dotFiles/.bashrc_ydmpc901

#Home MacBookAir
[[ "$HOSTNAME" =~ MacBookAir.local ]] && source_file ~/dotFiles/.bashrc_MacBookAir

#Home Macmini
[[ "$HOSTNAME" =~ Macmini.local ]] && source_file ~/dotFiles/.bashrc_Macmini

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

alias ls='ls -aFG --color -h -1 -l --group-directories-first'
alias ll='ls -alFG --color -h -1 -l --group-directories-first'



#Office Linux Desktop
[[ "$HOSTNAME" =~ MM07-MDTN005 ]] && source_file ~/dotFiles/.bashrc_ydmdtn005

#Office Raspberry Pi
[[ "$HOSTNAME" =~ ydmpc901 ]] && source_file ~/dotFiles/.bashrc_ydmpc901

#Home MacBookAir
[[ "$HOSTNAME" =~ MacBookAir.local ]] && source_file ~/dotFiles/.bashrc_MacBookAir

#Home Macmini
[[ "$HOSTNAME" =~ Macmini.local ]] && source_file ~/dotFiles/.bashrc_Macmini

#Home MacPro2006
[[ "$HOSTNAME" =~ MacPro2006.local ]] && source_file ~/dotFiles/.bashrc_MacPro2006

#Home MacPro2012
[[ "$HOSTNAME" =~ MacPro2012.local ]] && source_file ~/dotFiles/.bashrc_MacPro2012

#MacBookAirKasumi
[[ "$HOSTNAME" =~ KatsuminoMacBook-Air.local ]] && source_file ~/dotFiles/.bashrc_MacBookAirKatsumi

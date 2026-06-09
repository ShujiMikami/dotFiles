case "$(uname)" in
	Darwin)
		export LSCOLORS="GxFxCxDxBxegedabagaced"
		alias ls='ls -G'
		;;
	Linux)
		export LS_COLORS='di=34:ln=35:ex=32'
		alias ls='ls --color=auto'
		;;
esac

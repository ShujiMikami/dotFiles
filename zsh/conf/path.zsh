# 重複防止
typeset -U path PATH

# Homebrew (Apple Silicon)
if [[ -d /opt/homebrew/bin ]]; then
	path=(
		/opt/homebrew/bin
		/opt/homebrew/sbin
		$path
	)
fi

# Homebrew (Intel)
if [[ -d /usr/local/bin ]]; then
	path=(
		/usr/local/bin
		/usr/local/sbin
		$path
	)
fi

# ユーザーツール
if [[ -d "${HOME}/bin" ]]; then
	path=(
		"${HOME}/bin"
		$path
	)
fi


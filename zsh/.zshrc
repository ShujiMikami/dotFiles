# --------------- GetDirectory ---------------
ZSHRC_REALPATH="${(%):-%N}"
ZSHRC_DIR="${ZSHRC_REALPATH:A:h}"

DOTFILES_DIR="${ZSHRC_DIR:h}"

# --------------- Common Settings ------------
source "${DOTFILES_DIR}/shell/common.sh"

for f in \
	history.zsh \
	completion.zsh \
	prompt.zsh \
	alias.zsh \
	path.zsh \
	color.zsh \
	tools.zsh
do
	source "${DOTFILES_DIR}/zsh/conf/${f}"
done





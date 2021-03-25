# カレントディレクトリパスを取得
DOTFILES_DIR=$(cd $(dirname $0) && pwd)

git clone https://github.com/pyenv/pyenv.git $DOTFILES_DIR/.cache/.pyenv
echo "export PYENV_ROOT="$DOTFILES_DIR/.cache/.pyenv" #pyenv root directory" >> $DOTFILES_DIR/.cache/.profile_python
echo 'export PATH="$PATH:$PYENV_ROOT/bin" #pyenv executable path' >> $DOTFILES_DIR/.cache/.profile_python
source $DOTFILES_DIR/.cache/.profile_python
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo -e '#pyenv init' >> $DOTFILES_DIR/.cache/.profile_python
echo -e 'if command -v pyenv 1>/dev/null 2>&1 ; then\n  eval "$(pyenv init -)"\nfi' >> $DOTFILES_DIR/.cache/.profile_python
echo -e '#pyenv virtualenv init' >> $DOTFILES_DIR/.cache/.profile_python
echo -e 'if command -v pyenv 1>/dev/null 2>&1 ; then\n  eval "$(pyenv virtualenv init -)"\nfi' >> $DOTFILES_DIR/.cache/.profile_python

echo -e '#pyenv path settings' >> ~/.bash_profile
echo -e "if [ -f $DOTFILES_DIR/.cache/.profile_python ] ; then\n  source $DOTFILES_DIR/.cache/.profile_python\nfi" >> ~/.bash_profile


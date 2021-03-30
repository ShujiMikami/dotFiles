# カレントディレクトリパスを取得
DOTFILES_DIR=$(cd $(dirname $0) && pwd)

#インストール先
TARGET_DIRECTORY=$DOTFILES_DIR/.cache/Applications/.pyenv

#プロファイル保存ファイル
PYTHON_PROFILE=$DOTFILES_DIR/.cache/Profiles/.profile_python


git clone https://github.com/pyenv/pyenv.git $TARGET_DIRECTORY

if [ -f $PYTHON_PROFILE ] ; then
  rm $PYTHON_PROFILE
fi

if ! [ -d $DOTFILES_DIR/.cache/Profiles ] ; then
  mkdir $DOTFILES_DIR/.cache/Profiles
fi

echo "export PYENV_ROOT="$TARGET_DIRECTORY" #pyenv root directory" >> $PYTHON_PROFILE
echo 'export PATH="$PATH:$PYENV_ROOT/bin" #pyenv executable path' >> $PYTHON_PROFILE

source $PYTHON_PROFILE

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

echo -e '#pyenv init' >> $PYTHON_PROFILE
echo -e 'if command -v pyenv 1>/dev/null 2>&1 ; then\n  eval "$(pyenv init -)"\nfi' >> $PYTHON_PROFILE
echo -e '#pyenv virtualenv init' >> $PYTHON_PROFILE
echo -e 'if command -v pyenv 1>/dev/null 2>&1 ; then\n  eval "$(pyenv virtualenv-init -)"\nfi' >> $PYTHON_PROFILE

if ! command -v cat ~/.bash_profile | grep "#pyenv path settings" 1>/dev/null 2>&1 ; then
  echo -e "#pyenv path settings\nif [ -f $PYTHON_PROFILE ] ; then\n  source ${PYTHON_PROFILE}\nfi" >> ~/.bash_profile
fi

source ~/.bash_profile

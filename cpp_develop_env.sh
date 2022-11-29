# カレントディレクトリパスを取得
DOTFILES_DIR=$(cd $(dirname $0) && pwd)

echo "Set up overview"
echo "  Download LLVM 11.0.0"
echo "  Add LLVM bin dir to PATH"
echo "  Create python 3.9.2 virtualenv for compiledb and add script dir to PATH"
echo "  Install compiledb"
echo ""



#インストール先
TARGET_DIRECTORY=$DOTFILES_DIR/.cache/Applications/.pyenv

#プロファイル保存ファイル
PYTHON_PROFILE=$DOTFILES_DIR/.cache/Profiles/.profile_python

#.bash_profileへの記載文字列
BASH_PROFILE_STRING="if [ -f $PYTHON_PROFILE ] ; then source ${PYTHON_PROFILE} ; fi #pyenv path settings"
BASH_PROFILE_STRING_4_SEARCH="if \[ -f $PYTHON_PROFILE \] ; then source ${PYTHON_PROFILE} ; fi #pyenv path settings"


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

if grep -q "$BASH_PROFILE_STRING_4_SEARCH" ~/.bash_profile ; then
  echo "already exists"
else
  echo -e "$BASH_PROFILE_STRING" >> ~/.bash_profile
fi

source ~/.bash_profile

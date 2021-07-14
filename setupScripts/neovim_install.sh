# neovim download URL
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  DOWNLOAD_URL='https://github.com/neovim/neovim/releases/download/v0.4.4/nvim-linux64.tar.gz'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  DOWNLOAD_URL='https://github.com/neovim/neovim/releases/download/v0.4.4/nvim-macos.tar.gz'
fi

# カレントディレクトリパスを取得
DOTFILES_DIR=$(cd $(dirname $0) && pwd)/..
TARGET_DIR=$DOTFILES_DIR/.cache/Applications/neovim

# Download neovim from github
curl -L DOWNLOAD_URL > $TARGET_DIR/nvim.tar.gz
tar xzf nvim.tar.gz
  mv nvim-osx64 $TARGET_DIR
  echo "export NEOVIM_ROOT="$TARGET_DIR/nvim-osx64" #neovim root directory" >> $PROFILE
fi

#.bash_profileへの記載文字列
BASH_PROFILE_STRINGS=("export DOTFILES_ROOT=$DOTFILES_DIR" 'export NEOVIM_ROOT=$DOTFILES_DIR/.cache/Applications/neovim' 'export PATH=$NEOVIM_ROOT/bin:$PATH')


if [ ! -d $TARGET_DIR ] ; then
  mkdir $TARGET_DIR
fi

if [ -f $PROFILE ] ; then
  rm $PROFILE
fi


echo 'export PATH="$PATH:$NEOVIM_ROOT/bin" #neovim executable path' >> $PROFILE
source $DOTFILES_DIR/.cache/.profile_neovim

pyenv install 3.9.2
pyenv install 2.7.18

pyenv virtualenv 3.9.2 nvim-python3

pyenv virtualenv 2.7.18 nvim-python2

eval "$(pyenv init -)"
eval "$(pyenv vertualenv-init -)"

pyenv activate nvim-python3
pip3 install pynvim
pyenv deactivate nvim-python3

pyenv activate nvim-python2
pip install pynvim
pyenv deactivate nvim-python2

if grep -q "$BASH_PROFILE_STRING_4_SEARCH" ~/.bash_profile ; then
  echo "already exists"
else
  echo -e "$BASH_PROFILE_STRING" >> ~/.bash_profile
fi
source ~/.bash_profile

# カレントディレクトリパスを取得
CURRENT_DIR=$(cd $(dirname $0) && pwd)

# c++/c++_pythonを.cacheにコピー
cp -r ../c++/c++_python ~/.cache/ 

# pipenvのpipファイル直下に仮想環境を作成する設定
export PIPENV_VENV_IN_PROJECT=1

# neovim/nvim-python3の下でpipenv sync
cd ~/.cache/c++_python
pipenv sync



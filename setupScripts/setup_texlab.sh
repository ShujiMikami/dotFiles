TEXLAB_SITE_ADDRESS='https://github.com/latex-lsp/texlab/releases/download/v3.0.1/texlab-x86_64-macos.tar.gz'
TEXLAB_INSTALL_DIR="$HOME/dotFiles/.cache/Applications/texlab"

#download texlab
echo 'Step1 Download texlab3.0.1'
if [ -e 'texlab-x86-64-macos.tar.gz' ];then
  echo "texlab download file already exists. removing."
  rm -r 'texlab-x86-64-macos.tar.gz'
fi
curl $TEXLAB_SITE_ADDRESS -OL

#unzip llvm
echo 'Step2 Unzip TEXLAB'
tar -xvf 'texlab-x86_64-macos.tar.gz'

#romove texlab dir if exists
if [ -d $TEXLAB_INSTALL_DIR ];then
  echo "TexLab directory already exists. Removing."
  rm -r $TEXLAB_INSTALL_DIR
fi

#create llvm directory
echo "Create TexLab directory"
mkdir $TEXLAB_INSTALL_DIR

#move texlab to .cache/Applications/texlab
echo "Move texlab to dotFiles/.cache/Applications/texlab"
mv 'texlab' $TEXLAB_INSTALL_DIR

#remove downloaded file
rm -r 'texlab-x86_64-macos.tar.gz'



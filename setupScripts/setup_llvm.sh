LLVM_SITE_ADDRESS='https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-apple-darwin.tar.xz'
LLVM_INSTALL_DIR="$HOME/dotFiles/.cache/Applications/llvm"

##download llvm
echo 'Step1 Download LLVM12.0.0'
if [ -e 'clang+llvm-12.0.0-x86_64-apple-darwin.tar.xz' ]
  echo "LLVM download file already exists. removing."
  rm -r 'clang+llvm-12.0.0-x86_64-apple-darwin.tar.xz'
fi
curl $LLVM_SITE_ADDRESS -OL
#
##unzip llvm
echo 'Stem2 Unzip LLVM'
tar -xvf 'clang+llvm-12.0.0-x86_64-apple-darwin.tar.xz'

#romove llvm dir if exists
if [ -d $LLVM_INSTALL_DIR ];then
  echo "LLVM directory already exists. Removing."
  rm -r $LLVM_INSTALL_DIR
fi

#create llvm directory
echo "Create LLVM directory"
mkdir $LLVM_INSTALL_DIR

#move llvm to .cache/Applications/llvm
echo "Move LLVM to dotFiles/.cache/Applications/llvm"
mv 'clang+llvm-12.0.0-x86_64-apple-darwin' $LLVM_INSTALL_DIR

#remove downloaded file
rm -r 'clang+llvm-12.0.0-x86_64-apple-darwin.tar.xz'


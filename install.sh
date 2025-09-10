if [ -f ~/.zshrc ]; then
  mv $HOME/.zshrc $HOME/.zshrc.bak
fi

if [ -f ~/.zshpathrc ]; then
  mv $HOME/.zshpathrc $HOME/.zshpathrc.bak
fi

ln -s $(pwd)/.zshrc $HOME/.zshrc
cp $(pwd)/.zshpathrc $HOME/.zshpathrc

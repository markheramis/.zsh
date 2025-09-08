if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.bak
fi
ln -s .zshrc ~/.zshrc
ln -s .zshpathrc ~/.zshpathrc

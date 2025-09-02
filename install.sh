if [ -f ~/.zshrc ]; then
  cp ~/.zshrc ~/.zshrc.bak
fi
ln -s .zshrc ~/.zshrc
ln -s .zshpathrc ~/.zshpathrc
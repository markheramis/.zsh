if [ -f ~/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi

if [ -f ~/.zsh-path ]; then
    mv $HOME/.zsh-path $HOME/.zsh-path.bak
fi
if [ -f ~/.zsh-alias ]; then
    mv $HOME/.zsh-alias $HOME/.zsh-path.bak
fi

ln -s $(pwd)/.zshrc $HOME/.zshrc
cp $(pwd)/.zshpathrc $HOME/.zshpathrc

cp $(pwd)/.zsh-path $HOME/.zsh-path
cp $(pwd)/.zsh-alias $HOME/.zsh-alias

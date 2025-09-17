if [ -f ~/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi

if [ -f ~/.zsh-envs ]; then
  mv $HOME/.zsh-envs $HOME/.zsh-envs.bak
fi

if [ -f ~/.zsh-paths ]; then
  mv $HOME/.zsh-paths $HOME/.zsh-paths.bak
fi

if [ -f ~/.zsh-alias ]; then
  mv $HOME/.zsh-alias $HOME/.zsh-alias.bak
fi

if [ -f ~/.zsh-setup ]; then
  mv $HOME/.zsh-setup $HOME/.zsh-setup.bak
fi

ln -s $(pwd)/.zsh-setup $HOME/.zsh-setup
ln -s $(pwd)/.zsh-envs $HOME/.zsh-envs
ln -s $(pwd)/.zsh-paths $HOME/.zsh-paths
ln -s $(pwd)/.zsh-alias $HOME/.zsh-alias
ln -s $(pwd)/.zshrc $HOME/.zshrc
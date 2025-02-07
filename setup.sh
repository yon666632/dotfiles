# .zshrc
if [ -e ~/.zshrc ]; then
    echo "zshrc already exists."
else
    ln -s ~/dotfiles/zshrc ~/.zshrc
fi

# .gitconfig
if [ -e ~/.gitconfig ]; then
    echo "gitconfig already exists."
else
    ln -s ~/dotfiles/gitconfig ~/.gitconfig
fi

## .vim dir
#if [ -e ~/.config/nvim ]; then
#    echo "vim dir already exists."
#else
#    ln -s ~/dotfiles/vim ~/.config/nvim
#fi
#
## .vrapperrc
#if [ -e ~/.vrapperrc ]; then
#    echo "vrapperrc already exists."
#else
#    ln -s ~/dotfiles/vrapperrc ~/.vrapperrc
#fi

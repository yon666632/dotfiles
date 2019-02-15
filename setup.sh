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

# .vim dir
if [ -e ~/.vim ]; then
    echo "vim dir already exists."
else
    ln -s ~/dotfiles/vim ~/.vim
fi

# .vrapperrc
if [ -e ~/.vrapperrc ]; then
    echo "vim dir already exists."
else
    ln -s ~/dotfiles/vrapperrc ~/.vrapperrc
fi

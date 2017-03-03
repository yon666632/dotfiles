# .zshrc
if [ -e ~/.zshrc ]; then
    echo "zshrc already exists."
else
    ln -s ~/dotfiles/zshrc ~/.zshrc
fi

# .vimrc
if [ -e ~/.vimrc ]; then
    echo "vimrc already exists."
else
    ln -s ~/dotfiles/vimrc ~/.vimrc
fi

# .git-completion.bash
if [ -e ~/.git-completion.bash ]; then
    echo "git-completion.bash already exists."
else
    ln -s ~/dotfiles/git-completion.bash ~/.git-completion.bash
fi


# .git-prompt.sh
if [ -e ~/.git-prompt.sh ]; then
    echo "git-prompt.sh already exists."
else
    ln -s ~/dotfiles/git-prompt.sh ~/.git-prompt.sh
fi

# .gitconfig
if [ -e ~/.gitconfig ]; then
    echo "gitconfig already exists."
else
    ln -s ~/dotfiles/gitconfig ~/.gitconfig
fi

# .tmux.conf
if [ -e ~/.tmux.conf ]; then
    echo "tmux.conf already exists."
else
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
fi

# tool dir
if [ -e ~/tool ]; then
    echo "tool dir already exists."
else
    ln -s ~/dotfiles/tool ~/tool
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

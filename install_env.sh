# develop
sudo apt-get install make gcc g++ 
sudo apt-get install clang clang-tidy clang-tools clang-format cmake cppcheck doxygen graphviz
sudo apt-get install cmake cmake-curses-gui extra-cmake-modules

# qt
sudo apt-get install qttools5-dev qtbase5-dev qtdeclarative5-dev
sudo apt-get install qtmultimedia5-dev qtscript5-dev libqt5xmlpatterns5-dev
sudo apt-get install qml-module-qtquick-controls2

sudo apt-get install vim git subversion git-extras
sudo apt-get install tmux  tmuxinator 
sudo apt-get install exuberant-ctags

sudo apt-get install nvidia-cuda-dev nvidia-cuda-toolkit
sudo apt-get install libboost-all-dev

sudo apt-get install sdcv
sudo apt-get install curl
sudo apt-get install fzf
sudo apt-get install ranger

# doc
sudo apt-get install python3-sphinx pandoc
sudo pip3 install recommonmark
sudo pip3 install sphinx-markdown-tables
sudo pip3 install rst2pdf

# zsh
sudo apt-get install zsh
chsh -s /bin/zsh

# vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp ~/.config/nvim/autoload/plug.vim ~/.local/share/nvim/site/autoload/

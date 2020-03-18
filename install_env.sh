sudo apt-get install make gcc g++ 
sudo apt-get install qt5-default qttools5-dev 
sudo apt-get install qtmultimedia5-dev qtscript5-dev 
sudo apt-get install cmake cmake-gui
sudo apt-get install vim git subversion
sudo apt-get install tmux 
sudo apt-get install exuberant-ctags
sudo apt-get install clang-format
sudo apt-get install scdv
sudo ln -s /usr/bin/dict /usr/bin/sdcv
sudo apt-get install ckermit 
sudo apt-get install zsh curl

sudo rm ~/.oh-my-zsh -r
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s /bin/zsh

git config --global user.email "guojun.huang@qq.com"     
git config --global user.name  "guojun.huang" 
git config --global core.editor vim


read -p $'enter your email address for the generation of the ssh-key: \n' email
if [ $? -ne 0 ]; then
  # The user pressed Cancel
  echo $'cannot create ssh-key!'
elif [ -z "$email" ]; then
  # The user left the email address blank
  echo $'cannot create ssh-key!'
else
  ssh-keygen -t rsa -C $email
  echo $'\nAdd your new ssh-key to your github account! \n'
fi

cp mac_setup-master/dotfiles/.inputrc ~
cp mac_setup-master/dotfiles/.vimrc ~
cp mac_setup-master/dotfiles/.gvimrc ~

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

brew install git
brew install vim
# Git branch in prompt.
echo "parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }" >> .bashrc
echo 'export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "' >> .

brew install rbenv
brew install rbenv-gem-rehash
brew install ruby-build

echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

rbenv install 2.1.2
rbenv global 2.1.2

brew install mysql
brew install libxml2
bundle config build.nokogiri "--use-system-libraries --with-xml2-include=/usr/local/opt/libxml2/include/libxml2"

gem update --system
gem install rails

brew install nvm
echo "source $(brew --prefix nvm)/nvm.sh" >> ~/.bashrc
echo "[[ -r ~/.bashrc ]] && . ~/.bashrc" >> ~/.bash_profile

nvm install 0.10.28
nvm use 0.10.28 --default

npm install -g bower
npm install -g grunt-cli
npm install -g grunt-init

brew install caskroom/cask/brew-cask

brew cask install bettertouchtool
brew cask install google-chrome
brew cask install firefox

brew cask install virtualbox
brew cask install alfred
brew cask install dropbox
brew cask install skype
brew cask install android-studio
brew cask install cheatsheet
brew cask install google-drive
brew cask install vlc

brew tap caskroom/versions
brew cask install sublime-text3

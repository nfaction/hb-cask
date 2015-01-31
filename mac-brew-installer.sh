#!/bin/bash

xcode-select --install

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install Cask -----------------------------"
read -r -p "Are you sure? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    brew install caskroom/cask/brew-cask
else
	exit 1
fi

echo "Setting up 'brew bundle'..."
brew tap homebrew/boneyard

echo "export HOMEBREW_CASK_OPTS='--appdir=/Applications --caskroom=/etc/Caskroom'" >> ~/.bash_profile

echo "Setting up brew cask's permissions/directories..."
MY_UID=`id -u`
sudo chown $MY_UID /etc/Caskroom

brew doctor

echo "Please resolve warnings and errors expressed by 'brew doctor'.  Enter 'y' then 'Enter' if there are no warnings, otherwise, hit Control+C"
read answer

## Resources ##
# http://mattstauffer.co/blog/setting-up-a-new-os-x-development-machine-part-2-global-package-managers
# https://github.com/caskroom/homebrew-cask/blob/master/USAGE.md
# https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Installation.md

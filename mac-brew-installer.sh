#!/bin/bash

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#
# Ensure that this profile uses Homebrew's path instead of the OS X Builtin stuff
#
echo export PATH='/usr/local/bin:$PATH' >> ~/.bash_profile

echo "Setting up 'brew bundle'..."
brew tap Homebrew/bundle

echo "Install Cask? -----------------------------"
read -r -p "Are you sure? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    brew install caskroom/cask/brew-cask
    #
	# Change default Cask path to /Applications, not ~/Applications
	#
	echo "export HOMEBREW_CASK_OPTS='--appdir=/Applications'" >> ~/.bash_profile

	#
	# Set ownership of new Caskroom for user.  (This will thow errors in doctor and will not allow casks to be installed correctly)
	#
	echo "Setting up brew cask's permissions/directories..."
	sudo mkdir -p /etc/Caskroom
	MY_UID=$(id -u)
	sudo chown $MY_UID /etc/Caskroom
else
	echo "Not installing Cask..."
	echo "Please run 'brew doctor' and resolve all issues manually"
	exit 0
fi

echo "Sourcing your .bash_profile..."
source ~/.bash_profile

#
# Run Brew Doctor and resolve all issues
#
brew doctor

echo "It is highly recommended that you resolve all 'brew doctor' issues now, and then run:"
echo "brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup"

exit 0

#
## Resources ##
#
# http://mattstauffer.co/blog/setting-up-a-new-os-x-development-machine-part-2-global-package-managers
# https://github.com/caskroom/homebrew-cask/blob/master/USAGE.md
# https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Installation.md

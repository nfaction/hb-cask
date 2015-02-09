#!/bin/bash

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Setting up 'brew bundle'..."
brew tap homebrew/boneyard

echo "Install Cask? -----------------------------"
read -r -p "Are you sure? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    brew install caskroom/cask/brew-cask
    #
	# Change default Cask path to /Applications, not ~/Applications
	#
	echo "export HOMEBREW_CASK_OPTS='--appdir=/Applications --caskroom=/etc/Caskroom'" >> ~/.bash_profile

	#
	# Set ownership of new Caskroom for user.  (This will thow errors in doctor and will not allow casks to be installed correctly)
	#
	echo "Setting up brew cask's permissions/directories..."
	MY_UID=$(id -u)
	sudo chown $MY_UID /etc/Caskroom
else
	echo "Not installing Cask..."
	echo "Please run 'brew doctor' and resolve all issues manually"
	exit 0
fi

#
# Run Brew Doctor and resolve all issues
#
brew doctor

exit 0

#
## Resources ##
#
# http://mattstauffer.co/blog/setting-up-a-new-os-x-development-machine-part-2-global-package-managers
# https://github.com/caskroom/homebrew-cask/blob/master/USAGE.md
# https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Installation.md

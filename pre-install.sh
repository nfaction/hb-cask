#!/bin/bash

#
# Get OS X Version
#
vers=$(sw_vers | grep "ProductVersion:" | cut -f2 | cut -f1-2 -d'.')

#
# Change directory into Downloads for work below
#
cd ~/Downloads

#
# Perform Xcode Command Line Tools install per OS
#
if [ $vers == "10.6" ]
then
	# Pull down from SISTA website
	# curl -O -L http://w3.sista.arizona.edu/software/xcode_3.2.6_and_ios_sdk_4.3.dmg
	# hdiutil mount xcode_3.2.6_and_ios_sdk_4.3.dmg
	echo "Not implemented for Snow Leopard"
	echo "Please install Xcode and Xcode Commandline tools manually..."
	exit 0
elif [ $vers == "10.7" ]
then
	# Pull down from SISTA website
	# curl -O -L http://w3.sista.arizona.edu/software/xcode462_cltools_10_76938260a.dmg
	# hdiutil mount xcode462_cltools_10_76938260a.dmg
	echo "Not implemented for Lion"
	echo "Please install Xcode and Xcode Commandline tools manually..."
	exit 0
elif [ $vers == "10.8" ]
then
	# Pull down from SISTA website
	# curl -O -L http://w3.sista.arizona.edu/software/commandline_tools_os_x_mountain_lion_for_xcode__march_2014.dmg
	# hdiutil mount commandline_tools_os_x_mountain_lion_for_xcode__march_2014.dmg
	echo "Not implemented for Mountain Lion"
	echo "Please install Xcode and Xcode Commandline tools manually..."
	exit 0
else
	xcode-select --install
fi

subvers=$(sw_vers | grep "ProductVersion:" | cut -f2 | cut -f2 -d'.')

echo "Installing Git..."

if [ $subvers -lt 9 ]
then
	curl -O -L http://sourceforge.net/projects/git-osx-installer/files/git-2.2.1-intel-universal-snow-leopard.dmg
	hdiutil mount git-2.2.1-intel-universal-snow-leopard.dmg
	sudo installer -pkg /Volumes/Git\ 2.2.1\ Snow\ Leopard\ Intel\ Universal/git-2.2.1-intel-universal-snow-leopard.pkg -target /
	hdiutil unmount /Volumes/Git\ 2.2.1\ Snow\ Leopard\ Intel\ Universal/
else
	curl -O -L http://sourceforge.net/projects/git-osx-installer/files/git-2.2.1-intel-universal-mavericks.dmg
	hdiutil mount git-2.2.1-intel-universal-mavericks.dmg
	sudo installer -pkg /Volumes/Git\ 2.2.1\ Mavericks\ Intel\ Universal/git-2.2.1-intel-universal-mavericks.pkg -target /
	hdiutil unmount /Volumes/Git\ 2.2.1\ Mavericks\ Intel\ Universal
fi

echo "Done..."

exit 0
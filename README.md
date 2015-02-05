# Deploy Homebrew + Cask

Homebrew is a powerful Mac package management system that is actively developed.  Cask is a recent addition that allows Mac GUI applications to be installed, updated and managed.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/nfaction/hb-cask/master/pre-install)"
```

## Install Git on brand new machine
### Install Xcode Command Line Tools
```bash
xcode-select --install
```

### Install Git command line tools
```bash
curl -O -L http://sourceforge.net/projects/git-osx-installer/files/git-2.2.1-intel-universal-mavericks.dmg
hdiutil mount git-2.2.1-intel-universal-mavericks.dmg
sudo installer -pkg /Volumes/Git\ 2.2.1\ Mavericks\ Intel\ Universal/git-2.2.1-intel-universal-mavericks.pkg -target /
hdiutil unmount /Volumes/Git\ 2.2.1\ Mavericks\ Intel\ Universal
```

## Install Homebrew

To get started run the installer script
```bash
./mac-brew-installer.sh
```

## Cleanup
Be sure to resolve any errors and as many warnings as possible from the output of doctor.

Run these commands and fix issues:
```bash
brew doctor
```
and
```bash
brew cask doctor
```

Likely you will discover that brew cask installs will display errors.  To fix this, take ownership of the Caskroom by running this command:

```bash
MY_UID=`id -u`
sudo chown $MY_UID /etc/Caskroom
```

## Installing Brew Bundles

To install my basic brew core utilities and terminal applications add the bundles:
```bash
brew bundle brew/BUNDLE
```

To install my pre-built bundles select one of my recipies:
```bash
brew bundle cask/BUNDLE
```

To install new Cask recipies, run this:
```bash
brew bundle BUNDLE
```
# Resources
* Homebrew: http://brew.sh/
* Homebrew Cask: https://github.com/caskroom/homebrew-cask

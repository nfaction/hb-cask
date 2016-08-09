# Deploy Homebrew + Cask

Homebrew is a powerful Mac package management system that is actively developed.  Cask is a recent addition that allows Mac GUI applications to be installed, updated and managed.

## Install Xcode Command Line Tools and Git

```bash
bash <(curl -s https://raw.githubusercontent.com/nfaction/hb-cask/master/pre-install.sh)
```

## Download this repository and get Homebrew started
```bash
mkdir -p ~/bin && cd ~/bin && git clone https://github.com/nfaction/hb-cask.git &&  cd ~/bin/hb-cask/
```

## Install Homebrew

To get started run the installer script
```bash
./mac-brew-installer.sh
```

Reload your .bash_profile just to be sure
```bash
source ~/.bash_profile
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
brew bundle --file=bundles/core
```

To install my pre-built bundles select one of my recipies:
```bash
brew bundle --file=bundles/BUNDLE
```

## Cleanup

```
brew linkapps
```

# Resources
* Homebrew: http://brew.sh/
* Homebrew Cask: https://github.com/caskroom/homebrew-cask
* Homebrew-Bundle: https://github.com/Homebrew/homebrew-bundle

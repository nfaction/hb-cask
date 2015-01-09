# Deploy Homebrew + Cask

Homebrew is a powerful Mac package management system that is actively developed.  Cask is a recent addition that allows Mac GUI applications to be installed, updated and managed.

To get started run the installer script
```bash
./mac-brew-installer.sh
```

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

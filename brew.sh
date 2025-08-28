#!/usr/bin/env bash

# Install command-line tools using Homebrew.
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# helix, language servers, formatters and other utils
brew install helix
brew install dprint
brew install goimports
brew install golang-migrate
brew install gopls
brew install omnisharp/omnisharp-roslyn/omnisharp
brew install prettier
brew install tailwindcss-language-server
brew install taplo
brew install typescript-language-server
brew install vscode-langservers-extracted
brew install yaml-language-server

# useful tools
brew install carapace
brew install fd
brew install fzf
brew install gawk
brew install gh
brew install grep
brew install jq
brew install lazygit
brew install mdless
brew install pandoc
brew install pygments
brew install ripgrep
brew install shellcheck
brew install tmux
brew install tree
brew install wget
brew install yq

# Remove outdated versions from the cellar.
brew cleanup

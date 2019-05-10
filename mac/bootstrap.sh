#!/bin/sh

# Make sure that brew is installed
which brew > /dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask list powershell &> /dev/null || brew cask install powershell

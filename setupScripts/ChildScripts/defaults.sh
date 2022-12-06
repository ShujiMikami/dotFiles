#!/bin/bash

if [ "$(uname)" != "Darwin" ]; then
  echo "Not macOS. Skipping."
  exit 1
fi

# ====================Input source=============================
# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ====================Finder==============================-
# Show hidden files by defaults
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Reflect setting
killall Finder

# ====================Dock================================
# Enable auto-hide
defaults write com.apple.dock auto-hide -bool true

# Disable show recents
defaults write com.apple.dock show-recents -bool false




# Reflect setting
killall Dock


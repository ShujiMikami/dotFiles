#!/bin/bash

if [ "$(uname)" != "Darwin" ]; then
  echo "Not macOS. Skipping."
  exit 1
fi

# ====================General===========================
# Default browser Google chrome
defaults write com.google.Chrome LastRunAppBundlePath -string "/Applications/Google Chrome.app"

# ====================Keyboard=============================
# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Use fn key
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# Disable live conversion
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey -bool false

# ====================Sound================================
# Visible enable Sound
defaults write com.apple.controlcenter NSStatusItem Visible Sound -bool true

# ====================Bluetooth============================
# Visible enable Bluetooth 
defaults write com.apple.controlcenter NSStatusItem Visible Bluetooth -bool true

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


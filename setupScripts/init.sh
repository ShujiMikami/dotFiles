#!/bin/bash

if [ "$(uname)" != "Darwin" ]; then
  echo "Not macOS. Skipping."
  exit 1
fi

# Select shell as bash
chsh -s /bin/bash

# Install xcode toolset
xcode-select --install > /dev/null

# Install homebrew
if !(type "brew" > /dev/null 2>&1) ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
else
  echo "Skip. Homebrew already installed."
fi

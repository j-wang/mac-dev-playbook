#!/bin/bash
set -euo pipefail

xcode-select --install || true
sudo xcodebuild -license accept

if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export PATH="/opt/homebrew/bin:$PATH"

brew install ansible

ansible-galaxy install -r requirements.yml

sudo softwareupdate --install-rosetta --agree-to-license

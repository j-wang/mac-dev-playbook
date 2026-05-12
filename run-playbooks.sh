#!/bin/bash
set -euo pipefail

# Required for Apple Silicon bootstrap shells that haven't loaded ~/.zshrc yet.
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"

ansible-playbook main.yml --ask-become-pass "$@"

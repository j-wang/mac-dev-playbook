# mac-dev-playbook

Personal fork of [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook) for setting up a new Mac the way I like it. Installs Homebrew formulae, casks, Mac App Store apps, and configures the Dock.

The canonical inventory of what gets installed lives in [`config.yml`](config.yml). Upstream defaults are in [`default.config.yml`](default.config.yml).

## Provisioning a new Mac

```bash
# Bootstrap: Xcode CLT, Homebrew, Ansible, Ansible Galaxy roles, Rosetta
./pre-installer.sh

# Sign in to the Mac App Store manually (mas can't sign in automatically)

# Run the playbook
./run-playbooks.sh
```

Both scripts assume Apple Silicon (`/opt/homebrew`). Run with `--tags` to scope a re-run:

```bash
./run-playbooks.sh --tags "homebrew,dock"
```

Available tags: `homebrew`, `mas`, `dock`, `sudoers`, `terminal`, `osx`, `extra-packages`, `sublime-text`, `post`.

## Syncing with upstream

```bash
git fetch upstream
git log --oneline master..upstream/master   # see what's new
git merge upstream/master                   # or cherry-pick selectively
```

## Notes

- Dotfiles are managed separately at `~/dotfiles`, not by this playbook (`configure_dotfiles: false`).
- `configure_osx: false` — the upstream `.osx` script is skipped.
- The Sublime Text task file is kept upstream-side but disabled here (`configure_sublime: false`).

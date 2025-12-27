# NEED INSTALL TPM PLUGIN AND ADD CHMOD +X to TPM

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```

## Installing plugins

Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
Press _prefix + I_ (capital i, as in Install) to fetch the plugin.
You're good to go! The plugin was cloned to `~/.tmux/plugins/` dir and sourced.

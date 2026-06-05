# `~/.config` files

## Setup

1. Install the command-line tools:

   ```sh
   brew install ripgrep fzf neovim tmux
   brew install --cask ghostty wezterm
   ```

2. Clone the repository and its Neovim submodule:

   ```sh
   git clone --recurse-submodules git@github.com:saadjs/dotfiles.git ~/.config
   ```

3. Link the Zsh configuration:

   ```sh
   ln -s ~/.config/zsh/.zshrc ~/.zshrc
   ln -s ~/.config/zsh/.zprofile ~/.zprofile
   ```

4. Install the tmux plugin manager and plugins:

   ```sh
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ~/.tmux/plugins/tpm/bin/install_plugins
   ```

## Ghostty And Tmux

Run `tm` after opening Ghostty to create or attach to the persistent `main`
tmux session.

- `Cmd-T`: create a tmux window
- `Cmd-W`: close the active tmux window
- `Cmd-1` through `Cmd-9`: select a tmux window

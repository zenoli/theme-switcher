#!/bin/bash
# shellcheck disable=2086,2011,2128
THEME=$1

THEME_FILENAME=".theme"
THEME_HOME="$HOME/.config/theme"
CURRENT_THEME=$THEME_HOME/$THEME_FILENAME
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

# Update current theme state
echo $THEME > $CURRENT_THEME

# Update tmux theme
tmux source-file "$XDG_CONFIG_HOME/tmux/themes/$THEME.tmux"

# Update kitty theme
kitty +kitten themes --reload-in=all --config-file-name=theme-loader.conf $THEME

ls $XDG_RUNTIME_DIR/nvim.*.0 | xargs -I {} nvim --server {} --remote-send "<cmd>colorscheme $THEME-mod<cr>"

configs=(awesome kitty tmux zsh nvim)

for config in "${configs[@]}"; do
    echo $THEME > $XDG_CONFIG_HOME/$config/.theme
done

# Restart awesome
# kill -s SIGHUP $(pgrep awesome)

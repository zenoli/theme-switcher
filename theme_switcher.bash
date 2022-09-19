#!/bin/bash

THEME=$1
THEME_FILENAME=".theme"
THEME_HOME="$HOME/.config/theme"
CURRENT_THEME=$THEME_HOME/$THEME_FILENAME

# Update current theme state
echo $THEME > $CURRENT_THEME

# Update tmux theme
tmux source-file "$XDG_CONFIG_HOME/tmux/themes/$THEME.tmux"

# Update kitty theme
kitty +kitten themes --reload-in=all $THEME

# Update nvim theme in all listening nvim servers
NVIM_PIPES="/tmp/nvim-pipes"
[[ -d $NVIM_PIPES ]] || mkdir $NVIM_PIPES
ls $NVIM_PIPES | xargs -I {} sh -c "nvim --server $NVIM_PIPES/{} --remote-send ':colorscheme $THEME-mod<CR>'"

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

echo $XDG_CONFIG_HOME
AWESOME_HOME=$XDG_CONFIG_HOME/awesome
KITTY_HOME=$XDG_CONFIG_HOME/kitty
TMUX_HOME=$XDG_CONFIG_HOME/tmux
ZSH_HOME=$XDG_CONFIG_HOME/zsh
NVIM_HOME=$XDG_CONFIG_HOME/nvim

configs=(awesome kitty tmux zsh nvim)

for config in "${configs[@]}"; do
    echo $THEME > $XDG_CONFIG_HOME/$config/.theme
done


# Restart awesome
# kill -s SIGHUP $(pgrep awesome)

#!/bin/bash
# shellcheck disable=2086,2011,2128
PROJECT_ROOT=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
source $PROJECT_ROOT/config

THEME=$1
THEME_FILENAME=".theme"
THEME_HOME="$HOME/.config/theme"
CURRENT_THEME=$THEME_HOME/$THEME_FILENAME

# Update current theme state
echo $THEME > $CURRENT_THEME

# Update tmux theme
tmux source-file "$XDG_CONFIG_HOME/tmux/themes/$THEME.tmux"

# Update kitty theme
kitty +kitten themes --reload-in=all --config-file-name=theme-loader.conf $THEME

# Update nvim theme in all listening nvim servers
[[ -d $NVIM_PIPES ]] || mkdir $NVIM_PIPES
ls $NVIM_PIPES | xargs -I {} sh -c "nvim --server $NVIM_PIPES/{} --remote-send ':colorscheme $THEME-mod<CR>'"

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

configs=(awesome kitty tmux zsh nvim)

for config in "${configs[@]}"; do
    echo $THEME > $XDG_CONFIG_HOME/$config/.theme
done


# Restart awesome
# kill -s SIGHUP $(pgrep awesome)

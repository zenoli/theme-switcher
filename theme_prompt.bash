#!/bin/bash
PROJECT_ROOT=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
source $PROJECT_ROOT/config
THEMES=(
    onedark
    gruvbox
    papercolor
)

$PROJECT_ROOT/theme_switcher.bash $(echo ${THEMES[@]} | tr ' ' '\n' | dmenu -h 30 -p "Colorscheme: ")

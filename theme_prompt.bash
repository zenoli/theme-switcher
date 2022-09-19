#!/bin/bash
THEMES=(
    onedark
    gruvbox
)

./theme_switcher.bash $(echo ${THEMES[@]} | tr ' ' '\n' | dmenu -p "Colorscheme: ")

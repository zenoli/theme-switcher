#!/bin/bash
PROJECT_ROOT=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
THEMES=(
    onedark
    gruvbox
    papercolor
)

$PROJECT_ROOT/theme_switcher.bash $(echo ${THEMES[@]} | tr ' ' '\n' | dmenu -p "Colorscheme: ")

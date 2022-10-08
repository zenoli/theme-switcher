#!/bin/bash
# shellcheck disable=2086,2128
PROJECT_ROOT=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
source $PROJECT_ROOT/config

HEIGHT=$([[ -v 1 ]] && echo "-h $1")

echo $1

THEMES=(
	onedark
	gruvbox
	papercolor
)

SELECTED_THEME=$(echo "${THEMES[@]}" | tr ' ' '\n' | dmenu $HEIGHT -p "Colorscheme: ")
$PROJECT_ROOT/theme_switcher.bash ${SELECTED_THEME:-$DEFAULT_THEME}

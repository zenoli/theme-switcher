# theme-switcher
Script for switching neovim/thmux/awesome-wm/zsh/kitty themes using dmenu

# Dependencies
* nvim v.0.8 (requires nvim's remove client-server feature)
* dmenu

# Setup
Update the environment variables inside `config` and make sure the `nvim` script is in path 
(all nvim instances launched using this script will update their themes dynamically because they set up a server listening to theme changes).

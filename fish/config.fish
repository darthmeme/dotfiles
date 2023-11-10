eval (/opt/homebrew/bin/brew shellenv)

set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -U nvm_default_version 18
set -Ux EDITOR nvim

bind -m insert \cc kill-whole-line repaint
bind -M insert \cc kill-whole-line
bind -M insert \cBg lazygit

fish_add_path ~/.config/bin
fish_add_path ~/.config/tmux/plugins/t-smart-tmux-session-manager/bin

zoxide init fish | source
starship init fish | source

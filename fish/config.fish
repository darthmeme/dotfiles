eval (/opt/homebrew/bin/brew shellenv)

set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR nvim

bind -M insert \cc kill-whole-line

fish_add_path ~/.config/bin

zoxide init fish | source
starship init fish | source

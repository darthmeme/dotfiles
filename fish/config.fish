eval (/opt/homebrew/bin/brew shellenv)

set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR nvim

fish_add_path ~/.config/bin

zoxide init fish | source

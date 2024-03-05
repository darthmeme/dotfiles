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
fish_add_path /Users/akiralaine/Library/Python/3.11/bin/

zoxide init fish | source
starship init fish | source

function _nvm_version_match --argument-names ver
    string replace --regex -- '^v?(\d+|\d+\.\d+)$' 'v$1.' $ver |
        string replace --filter --regex -- '^v?(\d+)' 'v$1' |
        string escape --style=regex || string lower '\b'$ver'(?:/\w+)?$'
end

function __check_nvm --on-variable PWD --description 'Do nvm stuff'
  # Re-prepend the default node version to PATH.
  # Fixes issue with another binary that has its own Node version
  # being used instead of nvm's Node.
  set --local default_node_path (ls $nvm_data | string match --entire --regex -- (_nvm_version_match $nvm_default_version))

  set --prepend PATH $nvm_data/$default_node_path/bin

  if test -f .nvmrc
    set node_version (node -v)
    set nvmrc_node_version (nvm list | grep (cat .nvmrc))

    if set -q $nvmrc_node_version
      nvm install
    else if string match -q -- "*$node_version" $nvmrc_node_version
      # already current node version
    else
      nvm use -s
    end
  end
end

__check_nvm

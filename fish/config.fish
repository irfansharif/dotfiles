source $HOME/.config/fish/fishenv.fish

function __fish_default_command_not_found_handler --on-event fish_command_not_found
  functions --erase __fish_command_not_found_setup
  echo "'$argv' not found"
end

source ~/.config/fish/custom.fish
source ~/.config/fish/alias.fish

function fish_user_key_bindings
  # Bind `` to auto-complete current selection.
  bind `` forward-char

  # Hides the annoying ^C character in fish.
  bind \cc 'commandline ""'

  # Comes with `brew install fzf`. Also needs `brew install fd`.
  fzf --fish | source
  fzf_key_bindings
end

[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish


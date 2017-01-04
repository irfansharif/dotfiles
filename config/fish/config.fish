source $HOME/.config/fish/fishenv.fish

function fish_user_key_bindings
  # preserve old fish behavior of wiping out the line instead of creating a newline
  bind \cc 'commandline ""'
end

function __fish_default_command_not_found_handler --on-event fish_command_not_found
  functions --erase __fish_command_not_found_setup
  echo "'$argv' not found"
end


[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
rvm default

source /usr/share/autojump/autojump.fish
source $HOME/.config/fish/fishenv.fish

function __fish_default_command_not_found_handler --on-event fish_command_not_found
  functions --erase __fish_command_not_found_setup
  echo "'$argv' not found"
end

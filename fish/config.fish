source $HOME/.config/fish/fishenv.fish

function __fish_default_command_not_found_handler --on-event fish_command_not_found
  functions --erase __fish_command_not_found_setup
  echo "'$argv' not found"
end

source ~/.config/fish/custom.fish
source ~/.config/fish/alias.fish

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/irfansharif/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/irfansharif/Downloads/google-cloud-sdk/path.fish.inc'; end

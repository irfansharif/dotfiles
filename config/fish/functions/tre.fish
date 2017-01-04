# `tre` is a shorthand for `tree` with hidden files and color enabled,
# ignoring the `.git` directory listing directories first. Output is
# piped into `less` with options to preserve color and line numbers
# unless small enough for one screen.
function tre
  tree -aC -I '.git|node_modules' --dirsfirst "$argv" | less -FRX
end

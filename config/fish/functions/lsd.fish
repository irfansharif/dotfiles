function lsd
  ls -lF {$colorflag} | grep --color=never '^d'
end


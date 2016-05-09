# Place the following in /usr/share/applications/vim.desktop
# Exec=vim --servername VIMSERVER -c 'set bufhidden=wipe' --remote-silent %F

function v
  if vim --serverlist | grep VIMSERVER > /dev/null
    if count $argv > /dev/null
      vim $argv;
    else
      vim -c 'Startify'
    end
  else
    if count $argv > /dev/null
      vim --servername VIMSERVER $argv;
    else
      vim --servername VIMSERVER -c 'Startify'
    end
  end
end

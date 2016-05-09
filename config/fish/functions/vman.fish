function vman
  vim -c "SuperMan $argv"

  if [ "$status" != "0" ]
    echo "No manual entry for $argv"
  end
end


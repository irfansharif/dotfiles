function cdrd
  if git rev-parse --git-dir > /dev/null 2>&1
    cd (git rev-parse --show-toplevel)
  end
end

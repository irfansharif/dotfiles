function import-book
  echo ""  >> ~/Software/src/github.com/irfansharif/irfansharif.io/content/books/_index.md
  gbooks -t $argv >> ~/Software/src/github.com/irfansharif/irfansharif.io/content/books/_index.md
end

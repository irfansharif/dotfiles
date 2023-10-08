function dt
  dev test (rg "$argv[1]" -l | xargs dirname) -f $argv[1] -v --show-logs
  echo dev test (rg "$argv[1]" -l | xargs dirname) -f $argv[1] -v --show-logs
end

#!/usr/bin/env ruby
trap("SIGINT") { 
  exit
}

exit if ENV["TMUX"]

require 'rainbow'
require 'readline'
require_relative 'generate-name'

`tmux has-session -t primary-session || tmux new-session -s primary-session -d`

existing_sessions = `tmux list-sessions -F "#S"`.split( /\n/ )
available_options = [generate_name, 'no-session'] + existing_sessions

Readline.completion_proc = proc { |s|
  available_options.grep( /^#{Regexp.escape(s)}/ )
}

system 'clear'
print Rainbow("Ongoing sessions (#{available_options.length - 2}): ").color("B58900") + "\t"

available_options.each_with_index do |option, index|
  print "\t\t\t" if index > 0
  puts Rainbow("(#{index}) #{option}").color("CB4B16")
end

puts

choice = Readline.readline(
  Rainbow("Please choose/name your session (defaults to new session: #{available_options[0]}): ").color("0087FF"), true).strip

choice = available_options[choice.to_i <= available_options.length ? choice.to_i : 0] if choice =~ /^[-+]?[0-9]*$/
if choice == "no-session"
  exit
elsif choice != available_options[0] and available_options.include?(choice)
  `tmux attach-session -t #{choice}`
else
  `tmux new -s #{choice.nil? or choice.empty? ? available_options[0] : choice}`
end

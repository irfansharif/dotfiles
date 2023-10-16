#!/usr/bin/env ruby
exit if ENV["TMUX"]

trap("SIGINT") {
  exit
}

require 'readline'

l = %w(admiring adoring affectionate agitated amazing angry awesome
       blissful boring brave clever cocky compassionate competent
       condescending confident cranky dazzling determined distracted
       dreamy eager ecstatic elastic elated elegant eloquent epic fervent
       festive flamboyant focused friendly frosty gallant gifted goofy
       gracious happy hardcore heuristic hopeful hungry infallible
       inspiring jolly jovial keen kind laughing loving lucid mystifying
       modest musing naughty nervous nifty nostalgic objective optimistic
       peaceful pedantic pensive practical priceless quirky quizzical
       relaxed reverent romantic sad serene sharp silly sleepy stoic
       stupefied suspicious tender thirsty trusting unruffled upbeat
       vibrant vigilant vigorous wizardly wonderful xenodochial youthful
       zealous zen)

r = %w(albattani allen almeida agnesi archimedes ardinghelli aryabhata
       austin babbage banach bardeen bartik bassi beaver bell benz
       bhabha bhaskara blackwell bohr booth borg bose boyd brahmagupta
       brattain brown carson chandrasekhar shannon clarke colden cori
       cray curran curie darwin davinci dijkstra dubinsky easley edison
       einstein elion engelbart euclid euler fermat fermi feynman
       franklin galileo gates goldberg goldstine goldwasser golick
       goodall haibt hamilton hawking heisenberg hermann heyrovsky
       hodgkin hoover hopper hugle hypatia jackson jang jennings jepsen
       johnson joliot jones kalam kare keller kepler khorana kilby kirch
       knuth kowalevski lalande lamarr lamport leakey leavitt lewin
       lichterman liskov lovelace lumiere mahavira mayer mccarthy
       mcclintock mclean mcnulty meitner meninsky mestorf minsky
       mirzakhani morse murdock neumann newton nightingale nobel noether
       northcutt noyce panini pare pasteur payne perlman pike poincare
       poitras ptolemy raman ramanujan ride montalcini ritchie roentgen
       rosalind saha sammet shaw shirley shockley sinoussi snyder spence
       stallman stonebraker swanson swartz swirles tesla thompson
       torvalds turing varahamihira visvesvaraya volhard wescoff wiles
       williams wilson wing wozniak wright yalow yonath)

generated_name = "#{l.sample}-#{r.sample}"

existing_sessions = `tmux list-sessions -F "#S"`.split(/\n/).sort
available_options = existing_sessions + [generated_name, 'dev-box', 'no-session']

Readline.completion_proc = proc { |s|
  available_options.grep( /^#{Regexp.escape(s)}/ )
}

system 'clear'

class String
  def solarized_yellow
    "\e[38;5;136m" + self + "\e[0m"
  end

  def solarized_orange
    "\e[38;5;166m" + self + "\e[0m"
  end

  def solarized_blue
    "\e[38;5;32m" + self + "\e[0m"
  end
end

print "Ongoing sessions (#{available_options.length - 1}): \t".solarized_yellow

available_options.each_with_index do |option, index|
  print "\t\t\t" if index > 0
  puts "(#{index}) #{option}".solarized_orange
end

puts

default_choice = generated_name
if existing_sessions.length() > 0
  default_choice = existing_sessions[0]
end

choice = Readline.readline(
      "Choose/name your session (default, #{default_choice}): ".solarized_blue, true)
  .strip

if choice == "no-session"
  exit
elsif choice == "dev-box"
  system 'ssh modal-dev2'
  exit
elsif (available_options.include?(choice) and choice != generated_name)
  `tmux attach-session -t #{choice}`
elsif (choice.nil? or choice.empty?)
  if existing_sessions.include?(default_choice)
    `tmux attach-session -t #{default_choice}`
  else
    `tmux new -s #{default_choice}`
  end
end

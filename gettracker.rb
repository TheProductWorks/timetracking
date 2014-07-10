#!/usr/bin/env ruby

DEFAULT_TARGET="$HOME/.timetracking"
REPO="git@github.com:CrazyHorseHQ/timetracking.git"
target = DEFAULT_TARGET

puts "> Setting up the repo; Current location:"
puts `echo #{DEFAULT_TARGET}`
puts "Would you like to change to other location? [y/N]"
answer = STDIN.gets.gsub(/\n/,'').downcase
unless ["", nil, "n", "no"].include?(answer)
  puts "Please enter in new target location:"
  target = STDIN.gets.gsub(/\n/,'')
end

puts `mkdir -p #{target}` unless File.directory?(target)
puts "> Pull all the things!"

puts `cd #{target} && git clone #{REPO} .` unless File.directory?("#{target}/.git")
puts `cd #{target} && git checkout master && git pull origin master`

puts "> Add track to your path [Y/n]"
answer = STDIN.gets.gsub(/\n/,'').downcase
unless ["n", "no"].include?(answer)
  puts `ln -s #{target}/track /usr/local/bin/track`
end
puts "> Git hooks"
puts "Would you like to add track as a post commit hook? [Y/n]"
answer = STDIN.gets.gsub(/\n/,'').downcase
unless ["n", "no"].include?(answer)
  # TODO list or enter in git repos and add the hook in.
  # COMMANDS:
  # :> $REPO/.git/hooks/post-commit
  # echo "#!/bin/bash\n/usr/local/bin/track" >> $REPO/.git/hooks/post-commit
  # chmod a+x $REPO/.git/hooks/post-commit
end

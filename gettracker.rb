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
  unless `source $HOME/.bashrc && echo $PATH`.match("timetracking")
    puts `echo "export PATH=#{target}/bin:\\$PATH" >> $HOME/.bashrc`
  end
end
puts "> Git hooks"
puts "Would you like to add track as a post commit hook? [Y/n]"
answer = STDIN.gets.gsub(/\n/,'').downcase
unless ["n", "no"].include?(answer)
  puts <<-EOF
Go to your selected repo and run the following commands:
  $ :> $REPO/.git/hooks/post-commit
  $ echo "#!/bin/bash\ntrack" >> $REPO/.git/hooks/post-commit
  $ chmod a+x $REPO/.git/hooks/post-commit
EOF
end

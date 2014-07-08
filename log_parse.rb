require 'git'
require 'logger'
require 'json'

tt = Git.open(".", :log => Logger.new(STDOUT))

tt.log.each do |commit|
  begin
    message = JSON.parse(commit.message)
    puts message
  rescue JSON::ParserError
    puts "skipping non JSON commit message"
  end
end

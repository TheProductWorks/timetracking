class IndexController < ApplicationController
  def index
    tt = Git.open(".", :log => Logger.new(STDOUT))
    @commits = []

    tt.log.each do |commit|
      begin
        commit = JSON.parse(commit.message)
        @commits << commit
      rescue JSON::ParserError
        puts "skipping non JSON commit message"
      end
    end
  end
end

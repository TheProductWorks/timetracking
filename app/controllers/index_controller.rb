class IndexController < ApplicationController
  def index
    tt = Git.open(".", :log => Logger.new(STDOUT))
    @commit_array = []

    tt.log.each do |commit|
      begin
        commit_json = JSON.parse(commit.message)
        @commit_array << {
          commit_json: commit_json,
          commit_obj: commit
        }
      rescue JSON::ParserError
        puts "skipping non JSON commit message"
      end
    end
  end
end

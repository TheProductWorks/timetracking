class IndexController < ApplicationController
  def index
    tt = Git.open(".", :log => Logger.new(STDOUT))
    @projects = {}

    tt.log.each do |commit|
      begin
        commit_message_json = JSON.parse(commit.message)
        project = commit_message_json["project"]
        @projects[project] = [] unless @projects[project]

        @projects[project] << commit_message_json.merge({
          "author" => commit.author.name
        })
      rescue JSON::ParserError
        puts "skipping non JSON commit message"
      end
    end
  end
end

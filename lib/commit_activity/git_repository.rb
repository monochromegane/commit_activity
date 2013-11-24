require 'commit_activity/git/command'
module CommitActivity
  class GitRepository
    attr_accessor :url
    def initialize(url)
      @url = url
    end

    def log
      CommitActivity::Git::Command.new.execute(
        repository: @url,
        subcommand: '--no-pager log',
        options: {
          '--branches' => nil,
          '--pretty'   => '%cN,%ct',
          '--since'    => '2.weeks'
        }
      ) 
    end

  end
end

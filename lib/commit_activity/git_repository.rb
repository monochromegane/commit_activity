require 'commit_activity/git/command'
module CommitActivity
  class GitRepository
    attr_accessor :url
    def initialize(url)
      @url = url
    end

    def log(since: nil)
      options = {
        '--branches' => nil,
        '--pretty'   => '%cN,%ct'
      }
      options['--since'] = since.to_s if since.nil?
      CommitActivity::Git::Command.new.execute(
        repository: @url,
        subcommand: '--no-pager log',
        options:    options
      ) 
    end

  end
end

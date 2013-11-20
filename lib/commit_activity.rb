require "commit_activity/version"
require 'commit_activity/aggregater'

module CommitActivity
  class << self
    def aggregate
      CommitActivity::Aggregater.new
    end
  end
end

require "commit_activity/version"
require 'commit_activity/aggregater'

module CommitActivity
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield configuration
    end

    def aggregate
      CommitActivity::Aggregater.new
    end
  end

  class Configuration
    attr_accessor :repositories
  end
end

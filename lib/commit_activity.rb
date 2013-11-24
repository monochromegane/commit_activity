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
      aggregater = CommitActivity::Aggregater.new
      aggregater.on(*self.configuration.repositories) unless self.configuration.repositories.nil?
      aggregater
    end
  end

  class Configuration
    attr_accessor :repositories
  end
end

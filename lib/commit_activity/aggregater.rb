module CommitActivity
  class Aggregater

    def on(*repos)
      repos.each {|repo| repositories << CommitActivity::GitRepository.new(repo) }
      self
    end

    def since
    end

    def repositories
      @repositories ||= []
    end
  end
end

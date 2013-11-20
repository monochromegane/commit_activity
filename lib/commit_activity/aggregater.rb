module CommitActivity
  class Aggregater

    def on(*repos)
      repos.each {|repo| repositories << CommitActivity::GitRepository.new(repo) }
      self
    end

    def since(date)
      @since = date
      self
    end

    def repositories
      @repositories ||= []
    end

    def since_date
      @since
    end

  end
end

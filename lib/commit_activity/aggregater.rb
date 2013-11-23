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

    def raw
      activities = repositories.inject('') do |activity, repo|
        activity << repo.log 
      end
      activities
    end

    def repositories
      @repositories ||= []
    end

    def since_date
      @since
    end

  end
end

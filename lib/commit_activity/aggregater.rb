module CommitActivity
  class Aggregater
    attr_accessor :repositories
    def aggregate(*repositories)
      @repositories = []
      repositories.each {|repo| @repositories << CommitActivity::GitRepository.new(repo) }
    end
    def since
    end
  end
end

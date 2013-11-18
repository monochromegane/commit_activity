module CommitActivity
  class Aggregater
    attr_accessor :repositories
    def aggregate(*repositories)
      @repositories = repositories
    end
    def since
    end
  end
end

module CommitActivity
  class Aggregater
    attr_accessor :branches
    def aggregate(*branches)
      @branches = branches
    end
    def since
    end
  end
end

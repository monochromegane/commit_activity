module CommitActivity
  class GitRepository
    attr_accessor :url
    def initialize(url)
      @url = url
    end
  end
end

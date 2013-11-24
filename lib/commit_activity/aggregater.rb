require 'json'
require 'commit_activity/git_repository'
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

    def hash
      hash = raw.split("\n").inject([]) do |list, line|
        # raw to activity map
        user, time = line.chomp.split(',')
        list << {user: user, time: Time.at(time.to_i)}
      end.inject({}) do |users, activity|
        # group by user, day

        # initialize
        user = activity[:user]
        day  = activity[:time].strftime('%Y%m%d')
        users[user] ||= {}
        users[user][day] ||= {}
        users[user][day][:commit] ||= 0

        # set commit activity
        users[user][day][:first]  = activity[:time] if !users[user][day][:first] || users[user][day][:first] > activity[:time]
        users[user][day][:last]   = activity[:time] if !users[user][day][:last] || users[user][day][:last] < activity[:time]
        users[user][day][:commit] += 1
        users
      end
      hash
    end

    def json
      hash.to_json
    end

    def repositories
      @repositories ||= []
    end

    def since_date
      @since
    end

  end
end

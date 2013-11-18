require 'spec_helper'
require 'commit_activity/git_repository'

describe CommitActivity::GitRepository do
  subject { CommitActivity::GitRepository.new }
  it { should be_instance_of CommitActivity::GitRepository }
end


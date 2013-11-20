require 'spec_helper'
require 'commit_activity/git_repository'

describe CommitActivity::GitRepository do
  let(:url) { 'url' }
  subject { CommitActivity::GitRepository.new(url) }
  it { should be_instance_of CommitActivity::GitRepository }
end


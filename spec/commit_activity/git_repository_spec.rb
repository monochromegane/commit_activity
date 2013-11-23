require 'spec_helper'
require 'commit_activity/git_repository'

describe CommitActivity::GitRepository do
  let(:url) { '.' }
  subject { CommitActivity::GitRepository.new(url) }
  it { should be_instance_of CommitActivity::GitRepository }

  describe 'log' do
    subject { CommitActivity::GitRepository.new(url).log }
    it { should be_instance_of String }
  end
end


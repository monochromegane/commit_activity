require 'spec_helper'
require 'commit_activity/git_repository'

describe CommitActivity::GitRepository do
  let(:url) { '.' }
  subject { CommitActivity::GitRepository.new(url) }
  it { should be_instance_of CommitActivity::GitRepository }

  describe 'log' do
    let(:since) { Date.today - 14 }
    context 'when nil since given' do
      subject { CommitActivity::GitRepository.new(url).log }
      it { should be_instance_of String }
    end
    context 'when since given' do
      subject { CommitActivity::GitRepository.new(url).log(since: since) }
      it { should be_instance_of String }
    end
  end
end


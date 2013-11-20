require 'spec_helper'
require 'commit_activity/aggregater'
require 'commit_activity/git_repository'

describe CommitActivity::Aggregater do
  subject { CommitActivity::Aggregater.new }
  it { should be_instance_of CommitActivity::Aggregater }
  it { should be_respond_to :on }
  it { should be_respond_to :since }

  describe 'on' do

    context 'when a repository given.' do
      let(:params) { 'repository_name' }
      subject { CommitActivity::Aggregater.new.on(params) }
      it { should be_instance_of CommitActivity::Aggregater }
      it { expect(subject.repositories.first).to be_instance_of CommitActivity::GitRepository }
      it { expect(subject.repositories.first.url).to be_eql params }
    end

    context 'when repositories given.' do
      let(:params) { ['repository_a', 'repository_b'] }
      subject { CommitActivity::Aggregater.new.on(*(params)) }
      it { should be_instance_of CommitActivity::Aggregater }
      it { expect(subject.repositories.first).to be_instance_of CommitActivity::GitRepository }
      it { expect(subject.repositories.first.url).to be_eql params.first }
    end

  end
end

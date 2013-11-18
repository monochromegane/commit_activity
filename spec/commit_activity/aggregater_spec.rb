require 'spec_helper'
require 'commit_activity/aggregater'

describe CommitActivity::Aggregater do
  subject { CommitActivity::Aggregater.new }
  it { should be_instance_of CommitActivity::Aggregater }
  it { should be_respond_to :aggregate }
  it { should be_respond_to :since }

  describe 'aggregate' do

    context 'when a repository given.' do
      let(:params) { 'repository_name' }
      before { subject.aggregate(params) }
      its(:repositories) { should include(params) }
    end

    context 'when repositories given.' do
      let(:params) { ['repository_a', 'repository_b'] }
      before { subject.aggregate(*(params)) }
      its(:repositories) { should include(params[0]) }
      its(:repositories) { should include(params[1]) }
    end

  end
end

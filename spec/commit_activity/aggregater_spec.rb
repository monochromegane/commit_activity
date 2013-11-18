require 'spec_helper'
require 'commit_activity/aggregater'

describe CommitActivity::Aggregater do
  subject { CommitActivity::Aggregater.new }
  it { should be_instance_of CommitActivity::Aggregater }
  it { should be_respond_to :aggregate }
  it { should be_respond_to :since }

  describe 'aggregate' do

    context 'when a branch given.' do
      let(:params) { 'branch_name' }
      before { subject.aggregate(params) }
      its(:branches) { should include(params) }
    end

    context 'when branches given.' do
      let(:params) { ['branch_a', 'branch_b'] }
      before { subject.aggregate(*(params)) }
      its(:branches) { should include(params[0]) }
      its(:branches) { should include(params[1]) }
    end

  end
end

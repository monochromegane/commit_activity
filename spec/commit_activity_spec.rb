require 'spec_helper'

describe CommitActivity do
  it 'should have a version number' do
    CommitActivity::VERSION.should_not be_nil
  end

  describe 'aggregate' do
    subject { CommitActivity.aggregate }
    it { should be_instance_of CommitActivity::Aggregater }
  end

end

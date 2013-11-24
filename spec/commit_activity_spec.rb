require 'spec_helper'

describe CommitActivity do
  it 'should have a version number' do
    CommitActivity::VERSION.should_not be_nil
  end

  describe 'configure' do
    let(:repos) { ['repo1'] }
    subject { CommitActivity.configuration }
    context 'when configure' do
      before do
        CommitActivity.configure do |config|
          config.repositories = repos
        end
      end
      its(:repositories) { should be_eql repos }
    end
  end

  describe 'aggregate' do
    subject { CommitActivity.aggregate }
    it { should be_instance_of CommitActivity::Aggregater }
  end

end

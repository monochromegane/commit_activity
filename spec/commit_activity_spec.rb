require 'spec_helper'

describe CommitActivity do
  it 'should have a version number' do
    CommitActivity::VERSION.should_not be_nil
  end

  describe 'configure' do
    let(:repos) { ['repo1'] }
    subject { CommitActivity.configuration }
    after :each do
      CommitActivity.configuration.repositories = nil
    end

    context 'when configure' do
      before do
        CommitActivity.configure do |config|
          config.repositories = repos
        end
      end
      its(:repositories) { should be_eql repos }
    end

    context 'when not configure' do
      its(:repositories) { should be_nil }
    end
  end

  describe 'aggregate' do
    after :each do
      CommitActivity.configuration.repositories = nil
    end

    subject { CommitActivity.aggregate }
    it { should be_instance_of CommitActivity::Aggregater }

    context 'when not configure' do
      its(:repositories) { should be_eql [] }
    end

    context 'when configure' do
      let(:repos) { ['repo1'] }
      before do
        CommitActivity.configure do |config|
          config.repositories = repos
        end
      end
      it { expect(subject.repositories.first.repository).to be_eql repos.first }
    end
  end

end

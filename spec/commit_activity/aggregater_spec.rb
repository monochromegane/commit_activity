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

  describe 'since' do
    let(:since) { Date.today }
    subject { CommitActivity::Aggregater.new.since(since) }
    it { should be_instance_of CommitActivity::Aggregater }
    it { expect(subject.since_date).to be_eql since }
  end

  describe 'raw' do
    let(:repo) { '.' }
    subject { CommitActivity::Aggregater.new.on(repo, repo).raw }
    it { should be_instance_of String }
  end

  describe 'hash' do
    let(:repo) { '.' }
    subject { CommitActivity::Aggregater.new.on(repo, repo).hash }
    it { should be_instance_of Hash }
  end

end

require 'spec_helper'
require 'commit_activity/aggregater'

describe CommitActivity::Aggregater do
  subject { CommitActivity::Aggregater.new }
  it { should be_instance_of CommitActivity::Aggregater }
  it { should be_respond_to :aggregate }
  it { should be_respond_to :since }
end

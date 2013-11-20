require 'spec_helper'
require 'commit_activity/git/command'

describe CommitActivity::Git::Command do
  describe 'command_string' do
    let(:subcommand) { 'subcommand' }
    let(:options) { {'--opt1' => 'value1', '--opt2' => 'value2'} }
    subject do
      CommitActivity::Git::Command.new.command_string(
        subcommand: subcommand,
        options:    options
      )
    end
    it { should be_eql 'git subcommand --opt1=value1 --opt2=value2' }
  end
end

require 'spec_helper'
require 'commit_activity/git/command'

describe CommitActivity::Git::Command do
  describe 'command_string' do

    let(:subcommand) { 'subcommand' }
    subject do
      CommitActivity::Git::Command.new.command_string(
        subcommand: subcommand,
        options:    options
      )
    end

    context 'when given options which has key and value.' do
      let(:options) { {'--opt1' => 'value1', '--opt2' => 'value2'} }
      it { should be_eql 'git subcommand --opt1=value1 --opt2=value2' }
    end

    context 'when given options which has key and nil value.' do
      let(:options) { {'--opt1' => nil, '--opt2' => 'value2'} }
      it { should be_eql 'git subcommand --opt1 --opt2=value2' }
    end


  end
end

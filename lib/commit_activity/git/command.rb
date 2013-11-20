module CommitActivity
  module Git
    class Command
      def execute(subcommand: subcommand, options: options)
        command_string
      end
      def command_string(subcommand: subcommand, options: options)
        "git #{subcommand} " + options.map {|k,v| "#{k}=#{v}"}.join(' ')
      end
    end
  end
end

module CommitActivity
  module Git
    class Command
      def execute(subcommand: subcommand, options: options)
        command_string
      end
      def command_string(subcommand: subcommand, options: options)
        "git #{subcommand} " + 
          options.map do |k,v|
            if v.nil?
              "#{k}"
            else
              "#{k}=#{v}"
            end
          end.join(' ')
      end
    end
  end
end

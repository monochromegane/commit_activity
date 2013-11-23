require 'systemu'
module CommitActivity
  module Git
    class Command
      def execute(repository: repository, subcommand: subcommand, options: options)
        result = systemu "cd #{repository} && " + 
                  command_string(subcommand: subcommand, options: options)
        result[1] # return stdout
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

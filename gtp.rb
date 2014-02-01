module TurtleGTP

    class << self
    
        def parse(command)
            # Clean out certain characters and comments
            command.gsub!(/\r/, '')
            command.gsub!(/\t/, ' ')
            command.gsub!(/^.*\#.*$/, '')
            command.gsub!(/^\n$/, '')
            
            # Capture each part of the command
            cmd_regex = /((?<id>\d*)?\s)?(?<command>\w*)\s(?<arguments>\w*)?/
            cmd_parts = cmd_regex.match(command)
            puts cmd_parts.inspect
            puts cmd_parts[:id], cmd_parts[:command], cmd_parts[:arguments]
            return command
        end
    
    end

end

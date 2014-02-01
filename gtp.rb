module Turtle

    class GTP
        KNOWN_COMMANDS = [
            "protocol_version",
            "name",
            "version",
            "known_command",
            "list_commands",
            "quit",
            "boardsize",
            "clear_board",
            "komi",
            "play",
            "genmove"
        ]
        
        def initialize(params={})
            @board = params[:board]
            if not @board
                @board = Turtle::Board.new()
            end
        end

        def run(command)
            # Clean out certain characters and comments
            command.gsub!(/\r/, '')
            command.gsub!(/\t/, ' ')
            command.gsub!(/^.*\#.*$/, '')
            command.gsub!(/^\n$/, '')
            
            # Capture each part of the command
            cmd_regex = /((?<id>\d*)?\s)?(?<command>\w*)\s(?<arguments>.*)?/
            cmd_parts = cmd_regex.match(command)
            id = cmd_parts[:id]
            command = cmd_parts[:command]
            arguments = cmd_parts[:arguments].split(' ')
            
            # Look for the command name in the known command list
            known = known_command(command).match("^=")
            if known
                res = self.send(command, *arguments)
                if id && res.length != 0
                    res.gsub!("^=", "= " + id + " ")
                end
                
                return res
            else
                return "!"
            end
        end

        def protocol_version
            2
        end

        def name
            "Turtle Go"
        end

        def version
            "0.1"
        end
            
        def known_command(command)
            if KNOWN_COMMANDS.include?(command)
                "= true"
            else
                "? false"
            end
        end
        
        def list_commands
            "= " + KNOWN_COMMANDS.join("\n")
        end
        
        def quit
            abort("Quitting...")
        end
        
        def boardsize(size)
            if size > 25
                return "? unacceptable size"
            end
            
            @board.size = size
            return ""
        end
        
        def komi(new_komi)
            @board.komi = new_komi
            return ""
        end
        
        def play(color, vertex)
            color = color[0]    # use a single-char representation
            pos_x = vertex[0].downcase!
            pos_y = vertex.slice(1, vertex.length) - 1
            grid[pos_x][pos_y] = color
        end
    end

end

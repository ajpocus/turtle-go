module Turtle

    class Board
        def initialize(params={})
            @size = params[:size] || 19
            @komi = params[:komi] || 5.5
            @captures = {
                :white => 0,
                :black => 0
            }
        end
    end
    
end


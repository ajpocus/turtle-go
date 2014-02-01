module Turtle

    class Board
        def initialize(params={})
            @size = params[:size] || 19
            @komi = params[:komi] || 5.5
            @captures = {
                :w => 0,
                :b => 0
            }
            @grid = [[]]
        end
    end
    
end


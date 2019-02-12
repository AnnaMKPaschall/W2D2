require_relative "piece.rb"


class Bishop < Piece
    include Sliding
    
    def initialize(color, board, position)
        super
    end

    def move_dirs

        self.valid_move
    end

end
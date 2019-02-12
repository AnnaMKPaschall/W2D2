require_relative 'board.rb'
require 'byebug'
class Piece
    attr_reader :board, :color, :pos, :symbol 
    
    def initialize(color, board, position, symbol)
        @color = color
        @board = board
        @pos = position
        @symbol = symbol
    end

    def valid_moves
        move = []
    end

    def to_s
        #colorize gem only works on strings. this will translate symbols? into strings 
    end

    def empty?
        self.board[].empty?
        # if the possible position is empty?
    end

    def pos=(val) #val = which piece
    end

    def symbol

    end

    private
    def move_into_check?(end_pos)
    end
end

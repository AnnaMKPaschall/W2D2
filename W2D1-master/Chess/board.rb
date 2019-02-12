require 'byebug'
require_relative 'cursor.rb'
class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) {Array.new(8)} #create an 8 x 8 board, nil at all pieces 
        self.populate
        # @sentinel = NullPiece.new
    end

    def populate
        self.rows.each_with_index do |row, row_idx|
            row.each_with_index do |square, col_idx|
                pos = [row_idx, col_idx]
                if row_idx == 0 || row_idx == 7
                    self[pos] = 'I' #important pieces 
                elsif row_idx == 1 || row_idx == 6
                    self[pos] = 'p'
                else 
                    self[pos]= nil
                end
            end
        end
    end
    def [](pos) #referring to self. 
        row, col = pos #looking at board, seeing what piece is at the board position 
        @rows[row][col]
    end

    def []=(pos, val) #val is Queen or Rook or Knight (pieces) instead of nil where it is empty?
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "this position is empty" if self[start_pos] == nil #self because bracket method meant to be used on self/ board instance 
        self[end_pos] = self[start_pos] # assume we know where the piece is at, then we move the piece to end position and set it equal to next start position 
        self[start_pos] = nil #after moving position, reset its starting position to nil bc it is no longer there 
    end

    def valid_pos?(pos)
        row, col = pos
        return false if row < 0 || col < 0
        return false if row > rows.length - 1 || col > rows.length - 1
        return true
        # if self[pos].nil? 
        #     return false
        # else 
        #     return true
        # end   
    end
end
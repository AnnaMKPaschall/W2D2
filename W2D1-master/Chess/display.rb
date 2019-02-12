require 'colorize'
require 'colorized_string'
require_relative 'cursor.rb'
# require_relative 'board.rb'

# gem install colorize in terminal

class Display
    attr_reader :board, :cursor
    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
    end

    def render
        while true
        system("clear")
            cursor_pos = self.cursor.cursor_pos
            self.board.rows.each_with_index do |row, row_idx|
                row.each_with_index do |square, col_idx|
                    if cursor_pos == [row_idx, col_idx]
                        print square.colorize(:color => :red)
                    else
                        print square.colorize(:color => :blue)
                    end
                end
                puts 
            end
            self.cursor.get_input
        end
    end
end

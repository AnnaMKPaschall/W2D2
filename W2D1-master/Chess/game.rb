require_relative 'display.rb'
require_relative 'board.rb'

b = Board.new
d = Display.new(b)
d.render
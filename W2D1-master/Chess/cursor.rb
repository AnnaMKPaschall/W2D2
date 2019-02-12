require "io/console"
require "byebug"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    # cursor_pos is an array
    @board = board
    @selected = false
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  def toggle_selected
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key #which key we are looking at
    when :return, :space 
        #toggle_selected
        @cursor_pos 
    when :left, :right, :up, :down 
        update_pos(MOVES[key]) #update the position based on the value of the key in the moves hash
        return nil
    when :ctrl_c
        Process.exit(0) 
    end
  end

  def update_pos(diff)
   row, col = @cursor_pos #separating cursor position to row and column to reassign
    diff_row, diff_col = diff #separating the diff position (right left up down) into row and column to add to the cursor_pos
    new_row = row + diff_row
    new_col = col + diff_col
    new_pos = [new_row, new_col]
    # debugger
    @cursor_pos = new_pos if board.valid_pos?(new_pos) #the new position we want the cursor the move
    # using Board#valid_pos? (ensure you update @cursor_pos only if new position is valid)
    # cannot update the position if the position does not exit in the board
  end
end
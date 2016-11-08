class Board
  BOARD_COLS = 7
  BOARD_ROWS = 6

  attr_reader :board

  def initialize
    @board = Array.new
    BOARD_COLS.times do |rows|
      # row = Array.new
      # BOARD_COLS.times do |cols|
      #   row << ['r', 'y'][rand(2)]
      # end

      @board << Array.new(BOARD_COLS, ' ')
    end
  end

  def place_piece_in_column(column, piece)
    column = clamp(column, 0, BOARD_COLS-1)
    return false unless next_avaliable_spot(column)
    @board[column][next_avaliable_spot(column)] = piece
  end

  def winner
    diagonal = diagonal_winner
    return vertical_winner if vertical_winner > 0
    return diagonal if diagonal > 0
    return horizontal_winner if horizontal_winner > 0
    false
  end

  def display
    puts ""
    BOARD_COLS.times do |i|
      print "|"
      get_colum(i).each do |col|
        print col.empty? ? '  ' : "#{col} "
      end
      print "|\n"
    end
    puts ' A B C D E F G'
  end

  private
    def next_avaliable_spot(column)
      col = @board[column]

      col.to_enum.with_index.reverse_each do |c, index|
        return index if c == ' '
      end
      puts "false"
      return false
    end

    def get_colum(colum)
      # binding.pry
      @board.collect {|ind| ind[colum]}
    end

    def get_row(row)
      @board[row]
    end

    def horizontal_winner
      BOARD_COLS.times do |i|
        colum = get_colum(i).join("")
        return 1 if colum.include? "XXXX"
        return 2 if colum.include? "OOOO"
      end
      return -1
    end

    def vertical_winner
      BOARD_ROWS.times do |i|
        row = get_row(i).join("")
        return 1 if row.include? "XXXX"
        return 2 if row.include? "OOOO"
      end
      return -1
    end

    def diagonal_winner
      # construct an array of the pieces diagonal to the current piece
      BOARD_ROWS.times do |i|
        get_row(i).each_with_index do |row, index|
          dia = get_diagonal(index, i).join("")
          return 1 if dia.include? "XXXX"
          return 2 if dia.include? "OOOO"
        end
      end
      return -1
    end

    def get_diagonal(row, col)
      diagonal = Array.new
      diagonal << get_colum(col+1)[row+1]
      diagonal << get_colum(col+2)[row+2]
      diagonal << get_colum(col+3)[row+3]
      diagonal << get_colum(col+4)[row+4]
      diagonal << get_colum(col)[row]
      diagonal << get_colum(col-1)[row-1]
      diagonal << get_colum(col-2)[row-2]
      diagonal << get_colum(col-3)[row-3]
      diagonal << get_colum(col-4)[row-4]
      diagonal
    end

    def clamp(num, min, max)
      [[num, max].min, min].max
    end
end
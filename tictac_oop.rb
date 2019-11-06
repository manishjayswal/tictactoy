class TicTac
  def initialize
    @table_dimension = 3
    @board = Board.new(@table_dimension)
    @current_player = 'player_X'
    @current_player_symbol = 'X'
  end

  def check_won?
    @current_player_symbol = if @current_player == 'player_X'
                               'X'
                             else
                               'O'
                             end
    if @board.has_won?(@current_player_symbol)
      puts "Congratulations!!! #{@current_player} won this game."
      return true
    else
      return false
    end
  end

  def check_draw?
    return true if @board.full? && !check_won?

    false
  end

  def toggle_players
    if @current_player == 'player_X'
      @current_player = 'player_O'
      @current_player_symbol = 'O'
    else
      @current_player = 'player_X'
      @current_player_symbol = 'X'
    end
  end

  def start_game
    @board.display_board
    @board.get_box_positions(@current_player_symbol, @current_player)
    @board.display_board
    (1...@table_dimension * @table_dimension).each do
      return if check_won?

      toggle_players
      @board.get_box_positions(@current_player_symbol, @current_player)
      @board.display_board
    end
    puts 'This Game is Draw!!!' if check_draw?
  end
end

# class Player
# end

class Board
  def initialize(table_dimension)
    @table_dimension = table_dimension
    @box = Array.new(@table_dimension)
  end

  def display_board
    (0...@table_dimension).each do |row|
      (0...@table_dimension).each do |column|
        if !@box[@table_dimension * row + column].nil?
          print "\t#{@box[@table_dimension * row + column]}"
        else
          print "\t#{@table_dimension * row + column} "
        end

        print "\t|" if (column + 1) != @table_dimension
      end
      print "\n"
      if (row + 1) != @table_dimension
        (0...@table_dimension).each do
          print '----------------'
        end
      end
      print "\n"
    end
  end

  def fill_box(position, symbol)
    if box_location_valid?(position)
      @box[position] = symbol
      true
    else
      false
    end
  end

  def box_location_valid?(position)
    return position_available?(position) if within_board?(position)
  end

  def within_board?(position)
    if (0...@table_dimension * @table_dimension).include?(position)
      true
    else
      puts 'Your entered Position is out of bound!!'
    end
  end

  def position_available?(position)
    if @box[position].nil?
      true
    else
      puts 'Invalid Move! There is already a symbol there!'
    end
  end

  def has_won?(current_symbol)
    winning_diagonal1?(current_symbol) ||
      winning_diagonal2?(current_symbol) ||
      winning_verticals?(current_symbol) ||
      winning_horizontals?(current_symbol)
  end

  def winning_diagonal1?(current_symbol)
    counter = 0
    (0...@table_dimension).each do |row_index|
      if current_symbol == @box[row_index * (@table_dimension + 1)]
        counter += 1
      end
    end
    return true if counter == @table_dimension

    false
  end

  def winning_diagonal2?(current_symbol)
    counter = 0
    (0...@table_dimension).each do |row_index|
      if current_symbol == @box[(row_index + 1) * (@table_dimension - 1)]
        counter += 1
      end
    end
    return true if counter == @table_dimension

    false
  end

  def winning_verticals?(current_symbol)
    (0...@table_dimension).each do |row_index|
      counter = 0
      (0...@table_dimension).each do |column_index|
        if current_symbol == @box[row_index + column_index * @table_dimension]
          counter += 1
        end
      end
      return true if counter == @table_dimension
    end
    false
  end

  def winning_horizontals?(current_symbol)
    (0...@table_dimension).each do |row_index|
      counter = 0
      (0...@table_dimension).each do |column_index|
        if current_symbol == @box[row_index * @table_dimension + column_index]
          counter += 1
        end
      end
      return true if counter == @table_dimension
    end
    false
  end

  def full?
    counter = 0
    (0...@table_dimension * @table_dimension).each do |i|
      counter += 1 unless @box[i].nil?
    end
    return true if counter == @table_dimension * @table_dimension

    false
  end

  def get_box_positions(current_symbol, current_player)
    loop do
      position = ask_for_box_position(current_player)
      if valid_move?(position)
        break if fill_box(position, current_symbol)
      else
        puts 'Invalid Move!! Out of bound.'
      end
    end
  end

  def ask_for_box_position(current_player)
    puts "#{current_player}, enter the position where you want to place your mark:"
    gets.chomp.to_i
  end

  def valid_move?(position)
    total_number_of_box = @table_dimension * @table_dimension
    return true if (position >= 0) && (position < total_number_of_box)

    false
  end

end
tictac = TicTac.new
tictac.start_game

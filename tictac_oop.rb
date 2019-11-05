$table_dimension = 4
 class TicTac
    def initialize
        @board_object = Board.new
        # @player_object = Player.new
        @current_player = "player_X"
        @current_player_symbol = "X"
    end

    def get_box_positions
        loop do
            position = ask_for_box_position
            if valid_box_position?(position)
                if @board_object.fill_box(position, @current_player_symbol)
                    break
                end
            else
                puts "Invalid Position!!"
            end
        end
    end

    def ask_for_box_position
        puts "#{@current_player}, enter the position where you want to place your mark:"
        gets.chomp.to_i
    end

    def valid_box_position?(position)
        if (position >= 0) && (position < $table_dimension * $table_dimension)
            return true
        else
            return false
        end
    end

    def check_won?
        if @current_player == "player_X"
            @current_player_symbol = 'X'
        else
            @current_player_symbol ='O'
        end
        if(@board_object.winning_combination?(@current_player_symbol))
            puts "#{@current_player} won it."
            return true
        else
            return false
        end
    end
    
    def check_draw?
        if ( @board_object.is_full? && !check_won?() )
            puts "This Game is Draw!!!"
            return true
        else 
            return false
        end
    end

    def toggle_players
        if @current_player == "player_X"
            @current_player = "player_O"
            @current_player_symbol = 'O'
        else
            @current_player = "player_X"
            @current_player_symbol = 'X'
        end
    end

    def start_game
        @board_object.display_board

        get_box_positions
        @board_object.display_board
        (1...$table_dimension * $table_dimension).each {
            if (check_won?)
                return
            end
            toggle_players
            get_box_positions
            @board_object.display_board
        }
        check_draw?
        
    end

end

# class Player
# end

class Board

    def initialize
        @board = Array.new($table_dimension)
    end

    def display_board
        (0...$table_dimension).each { |row| 
            (0...$table_dimension).each { |column| 
            if (@board[$table_dimension * row + column] != nil )
                print "\t#{ @board[$table_dimension * row + column] }" #prints the box content
            else
                print "\t#{ $table_dimension * row + column } "                
            end

            if (column+1) != $table_dimension
                print "\t|"
            end
        }
        print "\n"
        
        if (row+1) != $table_dimension
            (0...$table_dimension).each { |column| 
            print "----------------"
            }   
        end
        print "\n"
        }
    end

    def fill_box(position, symbol)
        if box_location_valid?(position)
            @board[position] = symbol
            true
        else
            false
        end
    end

    def box_location_valid?(position)
        if within_board?(position)
            position_available?(position)
        end
    end

    def within_board?(position)
        if (0...$table_dimension * $table_dimension).include?(position)
            true
        else
            puts "Your entered Position is out of bound!!"
        end
    end

    def position_available?(position)
        if @board[position].nil?
            true
        else
            puts "There is already a symbol there!"
        end
    end

    def winning_combination?(current_symbol)

      winning_diagonal1?(current_symbol) ||
      winning_diagonal2?(current_symbol) || 
      winning_verticals?(current_symbol) || 
      winning_horizontals?(current_symbol)
    end

    def winning_diagonal1?(current_symbol)
       counter = 0
       (0...$table_dimension).each do |row_index|
           if ( current_symbol == @board[ row_index * ($table_dimension + 1) ])
                counter += 1
           end
       end
       if ( counter == $table_dimension )
            return true
       else
            return false
       end
    end

    def winning_diagonal2?(current_symbol)
        counter = 0
        (0...$table_dimension).each do |row_index|
            if ( current_symbol == @board[ (row_index + 1) * ($table_dimension - 1) ])
                counter += 1
            end
        end
        if ( counter == $table_dimension )
            return true
        else 
            return false
        end
    end

    def winning_verticals?(current_symbol)
        (0...$table_dimension).each do |row_index|
            counter = 0
            (0...$table_dimension).each do |column_index|
                if ( current_symbol == @board[ row_index + column_index * $table_dimension ])
                    counter += 1
                end
            end 
            if ( counter == $table_dimension)
                return true
            end
        end
        return false
    end

    def winning_horizontals?(current_symbol)
        (0...$table_dimension).each do |row_index|
            counter = 0
            (0...$table_dimension).each do |column_index|
                if ( current_symbol == @board[ row_index * $table_dimension + column_index ])
                    counter += 1
                end
            end 
            if ( counter == $table_dimension)
                return true
            end
        end
        return false 
    end

    def is_full?
        counter = 0
        (0...$table_dimension*$table_dimension).each { |i|
            if @board[i] != nil 
                counter += 1
            end
        }    
        if counter == $table_dimension * $table_dimension
            return true
        else
            return false
        end
    end

end


tictac_object = TicTac.new
tictac_object.start_game
# board_object.fill_box(4,'X')
# board_object.fill_box(1,'X')
# board_object.fill_box(7,'X')

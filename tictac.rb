# $table_dimension 
$player_number = 1 # its symbol is X
$counter = 0
$flag = 0
puts "Please enter dimension (eg. 3 , 4 or 5 ): "
$table_dimension = gets.chomp.to_i
$box_filled = Array.new( $table_dimension * $table_dimension, '' )

def display_board
    (0...$table_dimension).each { |row| 
        (0...$table_dimension).each { |column| 
            if ($box_filled[$table_dimension * row + column] =='')
                print "\t#{ $table_dimension * row + column } "
            else
                print "\t#{ $box_filled[$table_dimension * row + column] }" #prints the box content
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

def win_case(symbol)
    win_row = Array.new($table_dimension, 0)
    win_column = Array.new($table_dimension, 0)
    win_diagonal1 = 0
    win_diagonal2 = 0
    
    (0...$table_dimension).each { |row_index|
        (0...$table_dimension).each { |column_index|
            if ( $box_filled[ row_index * $table_dimension + column_index] == symbol )
                win_row[row_index] += 1
            end

            if ( $box_filled[ row_index + column_index * $table_dimension] == symbol)
                win_column[row_index] += 1
            end

            if ( (row_index == column_index ) && ( $box_filled[row_index * $table_dimension + column_index] == symbol))
                win_diagonal1 += 1
            end
        }

        if ( $box_filled[ (row_index+1) * ($table_dimension-1) ] == symbol )
            win_diagonal2 += 1
        end

        if ( ( win_row[row_index] == $table_dimension ) || (win_column[row_index] == $table_dimension ) || (win_diagonal1 == $table_dimension) || (win_diagonal2 == $table_dimension) )
            return 1
        end
    }
    return 0
end



$input_index
def start_game
    display_board()
    if ( $player_number == 1 )
        puts "It's player X turn"
    elsif ( $player_number == 2 )
        puts "It's player O turn"
    end

    puts "Please select the cell number: "
    $input_index = gets.chomp.to_i
    if ( $box_filled[$input_index] != '')
        puts "Warning! Please select a valid cell number from available boxes.\n\n\n"
        start_game()
    end
    if ( $player_number == 1 )
        $box_filled[ $input_index ] = 'X'
        $player_number = 2
    elsif ( $player_number == 2)
        $box_filled[ $input_index ] ="O"
        $player_number = 1
    end
    $counter +=1
    if ( win_case('X') == 1 )
        display_board()
        puts "Player X is the winner!!!"
        exit(true)
    elsif ( win_case('O') == 1 )
        display_board()
        puts "Player O is the winner!!!"
        exit(true)
        
    elsif( $counter == $table_dimension * $table_dimension )
        puts "the counter value is #{ $counter }."
        puts "Game is draw!!"
        exit(true)
    end
    start_game()
end

start_game()

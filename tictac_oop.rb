class TicTac
    
    def display_position_map
    end

    def start_game
    end

    def check_won
        # IF board says current player's piece has a winning_combination?
            # display a victory message
    end
    
    def check_draw
    end

    def toggle_players
    end
    
    #attributes
    table_dimension #interger
    
    player_X
    
    player_O

    cuurent_player # contains either player_x or player_O      
end


class Player
    
  def ask_cell_position
  end

  def validate_cell_position 
  end
  
end

class Board

    def winning_combination

    # winning_diagonal1
    # winning_diagonal2       
    # verticals        
    # horizontals
    end

    def full    
    end
    
end
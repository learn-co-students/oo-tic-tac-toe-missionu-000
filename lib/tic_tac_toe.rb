class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i
    index = index -1
    return index
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    if (@board[index] == "X" || @board[index] == "O")
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index <= 8 && index >= 0
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index) == true
      character = current_player
      move(index, character)
      display_board
    else
      turn
    end
  end


  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end

  def current_player
    num_turns = turn_count
    if num_turns % 2 == 0
      character = "X"
    else
      character = "O"
    end
    return character
  end

  def won?
    WIN_COMBINATIONS.each do |check|
      win_index_1 = check[0]
      win_index_2 = check[1]
      win_index_3 = check[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return check
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return check
      end
    end
    return false
  end

  def full?
    @board.all? do |index| index == "X" || index == "O"
    end
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won? || full?
      return true
    else
      return false
    end
  end

  def winner
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
   turn until over?
   puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
 end
end

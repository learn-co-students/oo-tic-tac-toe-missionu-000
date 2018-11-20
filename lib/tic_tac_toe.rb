class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(index)
    @board[index] != '' && @board[index] != ' ' && @board[index] != nil
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def move(index, token)
    @board[index] = token
  end

  def input_to_index(input)
    input.to_i-1
  end

  def turn_count
    @board.select {|position| position != ' '}.length
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      puts "Invalid move"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && @board[win_combination[0]] != ' '
    end
  end

  def full?
    @board.none?{|spot| spot == ' '}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?.nil?
      won?
    else
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end

    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end

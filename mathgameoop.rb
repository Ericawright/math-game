
require 'colorize'

class NotANumberError < StandardError
end

class Player
  attr_accessor :name, :lives
  attr_reader :points 

  def initialize(name)
    @name = name
    @points = 0
    @lives = 3
  end

  def gain_a_point
    @points += 1
  end

  def lose_a_life
    @lives -=1
  end
end

def is_not_a_number?(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil 
end

def not_a_number_error(correct_answer)
  raise NotANumberError, "Please enter a number!" 
  rescue NotANumberError
  puts 'that was not a number, try again'
  get_and_evalute_answer(correct_answer)
end

def user_input
  gets.chomp
end
      
def player_switch
  if @current_player  == @player1
    @current_player = @player2
    @other_player = @player1
  else
    @current_player = @player1
    @other_player = @player2
  end
end

def get_and_evalute_answer(correct_answer)
  user_answer = user_input
   return not_a_number_error(correct_answer) if is_not_a_number?(user_answer)
  if user_answer.to_i == correct_answer
    puts 'good job!'.green
    @current_player.gain_a_point
  else
    puts 'wrong'.yellow
    @current_player.lose_a_life
  end
end

def generate_question
  a = rand(1..20)
  b = rand(1..20)
  operation = [:+, :-, :*][rand(0..2)]

  puts "#{@current_player.name} What is #{a} #{operation} #{b} ?"
  a.send(operation, b)
end

def ask_question
  correct_answer = generate_question
  get_and_evalute_answer(correct_answer)
end

def play_again
  puts "#{@other_player.name}, you lose! #{@current_player.name}'s score was #{@current_player.points}"
  puts 'Do you want to play again with the same scores? (y/n)'
  play_again = gets.chomp.downcase
  if play_again == 'y'
    @player1.lives = 3
    @player2.lives = 3
    true
  end
end

def init_game
  @current_player = @player1
  @other_player = @player2
end

def get_user_input
  puts 'Hello, welcome to the math game, player one, please enter your name'
  @player1 = Player.new(user_input.red)
  puts 'Player two, please enter your name'
  @player2 = Player.new(user_input.blue) 
end

def run_game_loop
  while @other_player.lives > 0
    ask_question
    player_switch
  end
  run_game_loop if play_again
end




# puts is_not_a_number?('23 hello')
# is_not_a_number?('hello')

get_user_input
init_game
run_game_loop




require 'colorize'

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

#@player1 = Player.new('Erica')
#@player2 = Player.new('Eliza')

#puts @player2.lives


      
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
  user_answer = gets.chomp.to_i
  if user_answer == correct_answer
    puts 'good job!'
    @current_player.gain_a_point
  else 
    puts 'wrong'
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
  puts "#{@current_player.name}, you lose! #{@other_player.name}'s score was #{@other_player[:points]}"
  puts 'do you want to play again? (y/n)'
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
  @player1 = Player.new(gets.chomp.red)
  puts 'Player two, please enter your name'
  @player2 = Player.new(gets.chomp.blue) 
end

def run_game_loop
  while @current_player.lives > 0
    ask_question
    player_switch
  end
  run_game_loop if play_again
end

get_user_input
init_game
run_game_loop












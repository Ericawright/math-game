require 'colorize'
      
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
    puts 'good job'
    @current_player[:points] += 1
    #puts "#{@current_player[:name]} has #{@current_player[:points]} points and #{@current_player[:lives]}"
  else 
    puts 'wrong'
    @current_player[:lives] -= 1
  end
end

def generate_question
  a = rand(1..20)
  b = rand(1..20)
  operation = [:+, :-, :*][rand(0..2)]

  puts "#{@current_player[:name]} What is #{a} #{operation} #{b} ?"
  a.send(operation, b)
end

def ask_question
  correct_answer = generate_question
  get_and_evalute_answer(correct_answer)
end

def play_again
  puts "#{@current_player[:name]}, you lose! #{@other_player[:name]}'s score was #{@other_player[:points]}"
  puts 'do you want to play again? (y/n)'
  play_again = gets.chomp.downcase
  if play_again == 'y'
    @player1[:lives] = 3
    @player2[:lives] = 3
    true
  end
end

def init_game
  @player1 = {
    name: 'player 1',
    lives: 3,
    points: 0
  }
  @player2 = {
    name: 'player 2',
    lives: 3,
    points: 0
  }

  @current_player = @player1
  @other_player = @player2
end

def get_user_input
  puts 'Hello, welcome to the math game, player one, please enter your name'
  @player1[:name] = gets.chomp.red
  puts 'Player two, please enter your name'
  @player2[:name] = gets.chomp.blue 
end

def run_game_loop
  while @current_player[:lives] > 0
    ask_question
    player_switch
  end
  run_game_loop if play_again
end

init_game
get_user_input
run_game_loop






# def start
# puts 'Hello, welcome to the math game, player one, please enter your name'
# player1 = gets.chomp
# puts 'Player two, please enter your name'
# player2 = gets.chomp 
# end  

# players = {
#   player1: 3,
#   player2: 3
# }

# def user_names

# end

# def generate_question


#   # selection = randomize
#   # if selection == add
#   #   addition = lambda {|a,b| a + b}
#   # elsif  selection == sub
#   #   subtract = lambda {|a,b| a - b}
#   # elsif selection ==multi
#   #   multiply = lambda {|a,b| a * b}
#   # end


# end 

# def randomize
#   # random = rand(1..3)
#   # case random
#   # when 1
#   #   add
#   # when 2
#   #   sub
#   # when 3
#   #   multi
#   # end
      



@player1 = {
  name: 'player 1',
  lives: 3
}
@player2 = {
  name: 'player 2',
  lives: 3
}

while @player1[:lives] > 0
  def generate_question
    a = rand(1..20)
    b = rand(1..20)
    @answer = a + b
    puts "What does #{a} plus #{b} equal?"
    user_input

  end

  def user_input
    user_answer = gets.chomp.to_i
    if user_answer == @answer
      puts 'good job'
    else 
      puts 'wrong'
      @player1[:lives] -= 1
    end
  end

  generate_question

end


































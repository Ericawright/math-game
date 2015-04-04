

class Player
  attr_accessor :name
  attr_reader :points
  attr_reader :lives
  
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

@player1 = Player.new('Erica')
@player2 = Player.new('Eliza')














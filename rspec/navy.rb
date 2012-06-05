class Admiral
  def initialize(battleship)
    @battleship = battleship
  end

  def fire_on_target
    @battleship.fire!
  end
end

class Battleship
  attr_reader :ammunition

  def initialize
    @ammunition = 100
  end

  def fire!
    @ammunition = @ammunition - 1
  end
end

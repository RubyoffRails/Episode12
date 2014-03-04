class Admiral
  attr_reader :battleship
  def initialize(battleship)
    @battleship = battleship
  end

  def fire_upon_target
    @battleship.fire!
  end

end

class Battleship
  attr_reader :ammunition
  def initialize
    @ammunition = 10
  end

  def fire!
    @ammunition = @ammunition - 1
  end
end

class Admiral
  def initialize(battleship)
    @battleship = battleship
  end

  def fire_upon_target
    @battleship.fire!
  end

  def has_a_ship?
    true
  end

end

class Battleship
  attr_accessor :ammunition
  def initialize
    @ammunition = 10
  end

  def fire!
    @ammunition = @ammunition - 1
  end

  def more_ammo!(extra_ammunition)
    @ammunition += extra_ammunition
  end
end

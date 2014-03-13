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
    hit_or_miss
  end

  def get_ammo!
    @ammunition = @ammunition + 10
  end

  def hit_or_miss
    ["hit", "miss"].sample 
  end

end

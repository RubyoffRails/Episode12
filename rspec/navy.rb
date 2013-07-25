class Admiral
  attr_reader :battleship
  def initialize(battleship)
    @battleship = battleship
  end

  def fire_on_target
    @battleship.fire!
  end
  
  def give_more_ammo
    @battleship.refill_ammo
  end

end

class Battleship
  attr_reader :ammunition, :need_more_ammo
  def initialize
    @ammunition = 10
  end

  def fire!
    @ammunition = @ammunition - 1
    @need_more_ammo = @ammunition == 0
  end
  
  def refill_ammo
    @ammunition = 10
  end
end

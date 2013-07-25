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

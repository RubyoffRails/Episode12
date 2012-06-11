class Admiral
  attr_reader :total
  def initialize(battleship)
    @battleship = battleship
  end

  def fire_upon_target
    @battleship.fire!
  end
attr_reader :ships
def total_ships
  @battleship.total
end

def total!
	@total = @total

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

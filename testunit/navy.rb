class Battleship
  attr_reader :ammunition
  def initialize
    @ammunition = 100
  end

  def fire!
    @ammunition = @ammunition - 1
  end
end

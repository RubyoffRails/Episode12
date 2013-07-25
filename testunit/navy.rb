class Battleship
  attr_reader :ammunition
  def initialize
    @ammunition = 10
  end

  def fire!
    @ammunition = @ammunition - 1
  end
end

class Admiral
  def initialize(battleship)
    @battleship = battleship
  end

  def fire_upon_target
    @battleship.fire!
  end

end

module Fate
	def self.result
		shot = rand(2).round
		shot == 0 ? :miss : :hit
	end
end

class Battleship
  attr_reader :ammunition
  def initialize
    @ammunition = 100
  end

  def fire!
    if @ammunition > 0
      @ammunition -= 1
      Fate.result
    else
      # This could raise an exception, but for the moment, if you have
      # no ammo, you miss.
      return :miss
    end
  end

  def reload
	@ammunition += 100
  end
end

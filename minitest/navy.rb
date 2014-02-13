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


module Fate
  class Fate
    def hit_or_miss
      result = rand(5)+1
      result.even?
    end
  end
end

class Battleship
  include Fate
  attr_accessor :ammunition
  def initialize
    @ammunition = 10
    @hit = false
  end

  def fire!
    @hit = Fate.new.hit_or_miss
    @ammunition = @ammunition - 1
  end

  def reload!(extra_ammunition)
    @ammunition += extra_ammunition
  end
end

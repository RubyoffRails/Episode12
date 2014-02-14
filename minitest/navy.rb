class Admiral
  def initialize(battleship)
    @battleship = battleship
  end

  def fire_upon_target
    @battleship.fire!
  end

  def has_a_ship?
    @battleship.max_hits > 0
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

  INITIAL_AMMUNITION = 10
  MAX_HITS = 10

  attr_accessor :ammunition, :max_hits

  def initialize
    @ammunition = INITIAL_AMMUNITION
    @max_hits = MAX_HITS
  end

  def fire!
    @max_hits = @max_hits - 1 if Fate.new.hit_or_miss
    @ammunition = @ammunition - 1
  end

  def reload!(extra_ammunition)
    @ammunition += extra_ammunition
  end
end

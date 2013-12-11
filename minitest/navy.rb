class Admiral
  def initialize(battleship)
    @battleship = battleship
  end

  def fire_upon_target
    @battleship.fire!
  end

  def has_battleship
    battleship = Battleship.new
  end
end

class Battleship
  attr_reader :ammunition, :request
  def initialize
    @ammunition = 10
    @request = request
  end

  def fire!
    @ammunition = @ammunition - 1
  end

  def request
    true
  end

  def more_ammunition
    true
  end

  def verify
    if "hit"
      "hit"
    else
      "miss"
    end
  end
end

class Fate
  attr_reader :ammunition

  def initalize
    @hit = hit
    @miss = miss
  end

  def outcome
    [:hit, :miss].sample
  end
end


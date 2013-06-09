class Admiral
  attr_reader :battleship

  def initialize(battleship)
    @battleship = battleship
  end

  def fire_upon_target
    @battleship.fire!
  end

end

class Battleship
  attr_reader :ammunition, :armory, :fate
  def initialize(armory, fate)
    @ammunition = 10
    @armory = armory
    @fate = fate
  end

  def fire!
    @ammunition = @ammunition - 1
    reload! if @ammunition == 0
    fate.report
  end

  def reload!
    @ammunition += @armory.request_ammunition(10)
  end
end

class Armory
  attr_reader :ammunition_reserves

  def initialize(reserves)
    @ammunition_reserves = reserves
  end

  def request_ammunition(amount)
    if amount <= @ammunition_reserves
      @ammunition_reserves = @ammunition_reserves - amount
      amount
    else
      available = @ammunition_reserves
      @ammunition_reserves = 0
      available
    end
  end
  
end

class Fate 

  def initialize(randomizer=Random)
    @randomizer = randomizer
  end

  def report
    @randomizer.rand(11).even?
  end
end

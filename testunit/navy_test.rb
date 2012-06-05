require 'test/unit'
require_relative "navy"

class BattleshipTest < Test::Unit::TestCase
  def test_ammunition_usage
    battleship = Battleship.new
    starting_ammo = battleship.ammunition
    battleship.fire!
    assert_equal (starting_ammo - 1), battleship.ammunition
  end

end

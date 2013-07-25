require 'test/unit'
require_relative "../testunit/navy"

class BattleshipTest < Test::Unit::TestCase
  def test_ammunition_usage
    battleship = Battleship.new
    starting_ammo = battleship.ammunition
    battleship.fire!
    assert_equal (starting_ammo - 1), battleship.ammunition
  end
  
  def test_starting_ammunition
    battleship = Battleship.new
    assert_equal 10, battleship.ammunition
  end

end

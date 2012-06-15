require_relative "navy"
require "minitest/autorun"
require "minitest/mock"

class TestAdmiral < MiniTest::Unit::TestCase

  def setup
    @battleship = MiniTest::Mock.new
    @admiral = Admiral.new(@battleship)
  end

  def test_can_tell_the_battleship_to_fire
    @battleship.expect :fire!, nil
    @admiral.fire_upon_target
    @battleship.verify
  end
  def test_total_number_of_battleships
    battleship = Battleship.new
	total_ships = battleship.total
	assert_equal (total_ships 1), battleship.total
  end
  end

class TestBattleship< MiniTest::Unit::TestCase
  def test_will_decrease_ammunition_when_firing
    battleship = Battleship.new
    starting_ammunition = battleship.ammunition
    battleship.fire!
    assert_equal (starting_ammunition - 1), battleship.ammunition
  end
end

describe Battleship do
  it "should decrease ammo" do
    battleship = Battleship.new
    starting_ammunition = battleship.ammunition
    battleship.fire!
    battleship.ammunition.must_equal (starting_ammunition -1)
  end
end
#describe Admiral do
 # it "should have 1 battleship" do
  # battleship = Battleship.new
  # total_ships = battleship.total
  # battleship.ships.must_equal (1)
  #end
 #end


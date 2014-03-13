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
end

class TestAdmiral < MiniTest::Unit::TestCase
  
  def test_has_a_battleship
    @battleship = Battleship.new
    @admiral = Admiral.new(@battleship)
    assert_equal (@admiral.battleship), @battleship 
  end

end

class TestBattleship < MiniTest::Unit::TestCase
  def test_will_decrease_ammunition_when_firing
    battleship = Battleship.new
    starting_ammunition = battleship.ammunition
    battleship.fire!
    assert_equal (starting_ammunition - 1), battleship.ammunition
  end

  def test_starting_ammo_at_10
    battleship = Battleship.new
    assert_equal (10), battleship.ammunition
  end
end

describe Battleship do
  it "should decrease ammo" do
    battleship = Battleship.new
    starting_ammunition = battleship.ammunition
    battleship.fire!
    battleship.ammunition.must_equal (starting_ammunition -1)
  end

  it "should be able to request ammo" do
    battleship = Battleship.new
    starting_ammunition = battleship.ammunition
    battleship.get_ammo!
    battleship.ammunition.must_equal (starting_ammunition + 10)
  end

end

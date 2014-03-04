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

  it "should have starting ammo of 10" do
    battleship = Battleship.new
    starting_ammunition = battleship.ammunition
    starting_ammunition.must_equal (10)
  end
end

describe Admiral do
  it "should have a battleship" do
    battleship = Battleship.new
    admiral = Admiral.new(battleship)
    assert (1), admiral.battleship
  end
end

require_relative "navy"
require "minitest/autorun"
require "minitest/mock"

class TestAdmiral < MiniTest::Unit::TestCase

  def setup
    @battleship = MiniTest::Mock.new
    @admiral = Admiral.new(@battleship)
  end
  
  def test_confirming_admiral_has_battleship
    battleship = Battleship.new
    admiral = Admiral.new(battleship)
    assert_equal admiral.battleship, battleship
  end

  def test_can_tell_the_battleship_to_fire
    @battleship.expect :fire!, nil
    @admiral.fire_upon_target
    @battleship.verify
  end
  
  def test_can_give_battleship_more_ammo
    @battleship.expect :refill_ammo, nil
    @admiral.give_more_ammo
    @battleship.verify
  end
end

class TestBattleship< MiniTest::Unit::TestCase
  def setup
    @battleship = Battleship.new
  end
  
  def test_will_decrease_ammunition_when_firing
    starting_ammunition = @battleship.ammunition
    @battleship.fire!
    assert_equal (starting_ammunition - 1), @battleship.ammunition
  end
  
  def test_battleship_starts_with_10_ammo
    assert_equal 10, @battleship.ammunition
  end
  
  def test_battleship_can_request_more_ammo
    10.times do @battleship.fire! end
    assert_equal true, @battleship.need_more_ammo
  end
  
  def test_battleship_can_refill_ammo
    10.times do @battleship.fire! end
    @battleship.refill_ammo
    assert_equal 10, @battleship.ammunition
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

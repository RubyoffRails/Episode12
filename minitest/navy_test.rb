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
    @battleship.verify.must_equal (true)
  end

  def test_has_battleship
    battleship = Battleship.new
  end
end

class TestBattleship < MiniTest::Unit::TestCase
  def test_will_decrease_ammunition_when_firing
    battleship = Battleship.new
    starting_ammunition = battleship.ammunition
    battleship.fire!
    assert_equal (starting_ammunition - 1), battleship.ammunition
  end

  def test_ammunition
    battleship = Battleship.new
    starting_ammunition = battleship.ammunition
  end

  def test_request_more_ammunition
    battleship = Battleship.new
    battleship.request.must_equal (true)
  end

  def test_battleship_can_receive_more_ammunition
    battleship = Battleship.new
    starting_ammunition = battleship.ammunition
    battleship.more_ammunition.must_equal (true)
  end
end

class TestFate < MiniTest::Unit::TestCase
  def test_outcome
    #Not sure here
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

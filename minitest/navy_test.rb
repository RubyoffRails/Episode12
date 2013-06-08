require_relative "navy"
require "minitest/autorun"
require "minitest/mock"

class TestAdmiral < MiniTest::Unit::TestCase

  def setup
    @battleship = MiniTest::Mock.new
    @admiral = Admiral.new(@battleship)
  end

  def test_the_admiral_has_a_battleship
    assert_equal @battleship.object_id, @admiral.battleship.object_id
  end

  def test_can_tell_the_battleship_to_fire
    @battleship.expect :fire!, nil
    @admiral.fire_upon_target
    @battleship.verify
  end
end

class TestBattleship< MiniTest::Unit::TestCase
  def setup
    @battleship = Battleship.new
    @starting_ammunition = @battleship.ammunition
  end

  def test_starts_with_ten_rounds_of_ammunition
     assert_equal 10, @starting_ammunition 
  end

  def test_will_decrease_ammunition_when_firing
    @battleship.fire!
    assert_equal (@starting_ammunition - 1), @battleship.ammunition
  end
end

#describe Battleship do
#  it "should decrease ammo" do
#    battleship = Battleship.new
#    starting_ammunition = battleship.ammunition
#    battleship.fire!
#    battleship.ammunition.must_equal (starting_ammunition -1)
#  end
#end

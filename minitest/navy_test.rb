require_relative "navy"
require "minitest/autorun"
require "minitest/mock"

class TestAdmiral < MiniTest::Unit::TestCase

  def setup
    @battleship = MiniTest::Mock.new
    @admiral = Admiral.new(@battleship)
    @another_battleship = Battleship.new
    @another_admiral = Admiral.new(@another_battleship)
  end

  def test_can_tell_the_battleship_to_fire
    @battleship.expect :fire!, nil
    @admiral.fire_upon_target
    @battleship.verify
  end

  def test_have_a_battleship
    assert_equal true, @another_admiral.has_a_ship?
  end
end

class TestBattleship< MiniTest::Unit::TestCase

  def setup
    @mock_battleship = MiniTest::Mock.new
    @battleship = Battleship.new
    @starting_ammunition = @battleship.ammunition
  end

  def test_will_decrease_ammunition_when_firing
    @battleship.fire!
    assert_equal (@starting_ammunition - 1), @battleship.ammunition
  end

  def test_can_request_more_ammunition
    @mock_battleship.expect :reload!, nil
    @mock_battleship.reload!
    @mock_battleship.verify
  end

  def test_can_receive_more_ammunition
    extra_ammunition = 10
    @battleship.reload!(extra_ammunition)
    assert_equal (@starting_ammunition + extra_ammunition), @battleship.ammunition
  end

  def test_hit_or_miss
    @mock_battleship.expect :fire!, [true, false]
    @mock_battleship.fire!
    @mock_battleship.verify
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

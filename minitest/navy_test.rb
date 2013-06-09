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
    @armory = MiniTest::Mock.new
    @battleship = Battleship.new(@armory)
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

describe Battleship do

  it "should decrease ammo" do
    mock_armory = MiniTest::Mock.new
    ship = Battleship.new(mock_armory)
    starting_ammo = ship.ammunition
    ship.fire!
    ship.ammunition.must_equal (starting_ammo - 1)
  end

  it "can request more ammo" do
    mock_armory = MiniTest::Mock.new
    ship = Battleship.new(mock_armory)

    mock_armory.expect(:request_ammunition, 10, [Integer])
    while ship.ammunition >= 2
      ship.fire!
    end
    ship.fire!
    mock_armory.verify
  end

  it "should recieve more ammo" do
    mock_armory = MiniTest::Mock.new
    ship = Battleship.new(mock_armory)

    mock_armory.expect(:request_ammunition, 10, [Integer])
    starting_ammo = ship.ammunition
    ship.reload!
    ship.ammunition.must_equal (starting_ammo + 10)
  end

end

describe Armory do
  
  subject { Armory.new(100) }

  it "should have reserve ammunition" do
    subject.ammunition_reserves.must_equal(100)
  end

  it "should provide ammunition if it has enough" do
    ammo = subject.request_ammunition(10)
    ammo.must_equal 10
  end

  it "should provide partial ammunition if it doesn't have enough" do
    available = subject.ammunition_reserves
    ammo = subject.request_ammunition(available + 10)
    ammo.must_equal available
  end
end

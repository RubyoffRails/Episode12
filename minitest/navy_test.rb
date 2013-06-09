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
    @fate = MiniTest::Mock.new
    @battleship = Battleship.new(@armory, @fate)
    @starting_ammunition = @battleship.ammunition
  end

  def test_starts_with_ten_rounds_of_ammunition
     assert_equal 10, @starting_ammunition 
  end

  def test_will_decrease_ammunition_when_firing
    @fate.expect(:report, true)
    @battleship.fire!
    assert_equal @starting_ammunition - 1, @battleship.ammunition
  end
end

describe Battleship do

  let(:armory) { MiniTest::Mock.new }
  let(:fate) { MiniTest::Mock.new }
  let(:ship) { Battleship.new(armory, fate) }

  it "should decrease ammo" do
    fate.expect(:report, true)
    starting_ammo = ship.ammunition
    ship.fire!
    ship.ammunition.must_equal(starting_ammo - 1)
  end

  it "can request more ammo" do
    fate.expect(:report, true)
    armory.expect(:request_ammunition, 10, [Integer])
    while ship.ammunition >= 2
      ship.fire!
    end
    ship.fire!
    armory.verify
  end

  it "should recieve more ammo" do
    fate.expect(:report, true)
    armory.expect(:request_ammunition, 10, [Integer])
    starting_ammo = ship.ammunition
    ship.reload!
    ship.ammunition.must_equal(starting_ammo + 10)
  end

  it "should know if there was a hit or miss after firing" do
    fate.expect(:report, true)
    ship.fire!.must_equal(true)
  end

end

describe Armory do
  
  subject { Armory.new(100) }

  it "should have reserve ammunition" do
    subject.ammunition_reserves.must_equal(100)
  end

  it "should provide ammunition if it has enough" do
    subject.request_ammunition(10).must_equal 10
  end

  it "should provide partial ammunition if it doesn't have enough" do
    available = subject.ammunition_reserves
    subject.request_ammunition(available + 10).must_equal available
  end
end

describe Fate do

  it "should return true if rand is even" do
    mock_rand = MiniTest::Mock.new
    fate = Fate.new(mock_rand)
    mock_rand.expect(:rand, 6, [Integer])
    fate.report.must_equal true
  end

  it "should return false if rand is odd" do
    mock_rand = MiniTest::Mock.new
    fate = Fate.new(mock_rand)
    mock_rand.expect(:rand, 5, [Integer])
    fate.report.must_equal false
  end
end

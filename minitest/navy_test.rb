gem 'minitest'
require "navy"
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

describe Battleship do
	def setup
		@b = Battleship.new
	end

	it "should decrease ammo" do
		starting_ammunition = @b.ammunition
		@b.fire!
		@b.ammunition.must_equal (starting_ammunition - 1)
	end

	it 'should be able to request and receive more ammo' do
		100.times { @b.fire! }
		@b.ammunition.must_equal 0

		@b.reload
		@b.ammunition.must_equal 100
	end

	it 'should either hit or miss, depending on its Fate' do
		assert_includes([:hit, :miss], @b.fire!)
	end
end

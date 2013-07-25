require_relative "navy"
require "rspec"

describe Admiral do
  let(:battleship) { Battleship.new}
  subject {Admiral.new(battleship) }

  it "can tell the battleship to fire" do
    battleship.should_receive(:fire!)
    subject.fire_on_target
  end
  
  it "has a battleship" do
    subject.battleship.should eq(battleship)
  end
end

describe Battleship do
  it "decreases ammunition by 1 when firing" do
    expect {
      subject.fire!
    }.to change(subject, :ammunition).by(-1)
  end
  
  it "should start with 10 ammo" do
    subject.ammunition.should eq(10)
  end
end

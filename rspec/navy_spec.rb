require_relative "navy"
require "rspec"

describe Admiral do
  let(:battleship) { Battleship.new}
  subject {Admiral.new(battleship) }

  it "can tell the battleship to fire" do
    battleship.should_receive(:fire!)
    subject.fire_on_target
  end
end

describe Battleship do
  it "decreases ammunition by 1 when firing" do
    expect {
      subject.fire!
    }.to change(subject, :ammunition).by(-1)
  end

  it "receives ammunition upon request" do
    expect {
      subject.get_ammo!
    }.to change(subject, :ammunition).by(10)
  end
end

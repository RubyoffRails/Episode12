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

  it "receives a 'hit' or 'miss' after calling fire!" do
    subject.fire!.should eq("hit") || subject.fire!.should eq("miss")
    # The following syntax does not work, and I'm not sure why.
    # expect { subject.fire! }.to eq("hit")
  end
end

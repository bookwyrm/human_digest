require 'human_hash'

describe HumanHash do
  it "should generate a human hash" do
    HumanHash.humanize('60ad8d0d871b6095808297').should == 'sodium-magnesium-nineteen-hydrogen'
  end
end
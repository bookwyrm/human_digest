require 'human_hash'

describe HumanHash do
  it "should generate a human hash" do
    digest = '60ad8d0d871b6095808297'
    HumanHash.humanize(digest).should == 'sodium-magnesium-nineteen-hydrogen'
  end
  
  it "should compress byte arrays" do
    byte_array = [96, 173, 141, 13, 135, 27, 96, 149, 128, 130, 151]
    target = 4
    HumanHash.compress(byte_array, target).should == [205, 128, 156, 96]
  end
end
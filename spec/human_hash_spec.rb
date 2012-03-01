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
  
  it "should take a word count" do
    digest = '60ad8d0d871b6095808297'
    words = 4
    HumanHash.humanize(digest, words).should == 'sodium-magnesium-nineteen-hydrogen'
    
    words = 3
    HumanHash.humanize(digest, words).should == 'equal-monkey-hydrogen'    
  end
  
  it "should take a separator" do
    digest = '60ad8d0d871b6095808297'
    words = 4
    separator = '-'
    HumanHash.humanize(digest, words, separator).should == 'sodium-magnesium-nineteen-hydrogen'

    separator = ' '
    HumanHash.humanize(digest, words, separator).should == 'sodium magnesium nineteen hydrogen'
  end    
end
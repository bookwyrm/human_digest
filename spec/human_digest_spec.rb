require 'human_digest'
require 'bson'

describe HumanDigest do
  it "should generate a human digest" do
    digest = '60ad8d0d871b6095808297'
    HumanDigest.humanize(digest).should == 'sodium-magnesium-nineteen-hydrogen'
  end
  
  it "should compress byte arrays" do
    byte_array = [96, 173, 141, 13, 135, 27, 96, 149, 128, 130, 151]
    target = 4
    HumanDigest.compress(byte_array, target).should == [205, 128, 156, 96]
  end
  
  it "should take a word count" do
    digest = '60ad8d0d871b6095808297'
    words = 4
    HumanDigest.humanize(digest, words).should eq('sodium-magnesium-nineteen-hydrogen')
    
    words = 3
    HumanDigest.humanize(digest, words).should eq('equal-monkey-hydrogen')
  end
  
  it "should take a separator" do
    digest = '60ad8d0d871b6095808297'
    words = 4
    separator = '-'
    HumanDigest.humanize(digest, words, separator).should eq('sodium-magnesium-nineteen-hydrogen')

    separator = ' '
    HumanDigest.humanize(digest, words, separator).should eq('sodium magnesium nineteen hydrogen')
  end
  
  it "should humanize a BSON::ObjectId" do
    digest = BSON::ObjectId('4f501caf73e5ecb2c3000003')
    HumanDigest.humanize(digest).should eq('alaska-echo-nitrogen-alaska')
  end
end
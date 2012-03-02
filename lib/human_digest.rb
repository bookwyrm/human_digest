require "human_digest/version"

# HumanDigest - Human-readable representations of digests
module HumanDigest
  @word_list = [
      'ack', 'alabama', 'alanine', 'alaska', 'alpha', 'angel', 'apart', 'april',
      'arizona', 'arkansas', 'artist', 'asparagus', 'aspen', 'august', 'autumn',
      'avocado', 'bacon', 'bakerloo', 'batman', 'beer', 'berlin', 'beryllium',
      'black', 'blossom', 'blue', 'bluebird', 'bravo', 'bulldog', 'burger',
      'butter', 'california', 'carbon', 'cardinal', 'carolina', 'carpet', 'cat',
      'ceiling', 'charlie', 'chicken', 'coffee', 'cola', 'cold', 'colorado',
      'comet', 'connecticut', 'crazy', 'cup', 'dakota', 'december', 'delaware',
      'delta', 'diet', 'don', 'double', 'early', 'earth', 'east', 'echo',
      'edward', 'eight', 'eighteen', 'eleven', 'emma', 'enemy', 'equal',
      'failed', 'fanta', 'fifteen', 'fillet', 'finch', 'fish', 'five', 'fix',
      'floor', 'florida', 'football', 'four', 'fourteen', 'foxtrot', 'freddie',
      'friend', 'fruit', 'gee', 'georgia', 'glucose', 'golf', 'green', 'grey',
      'hamper', 'happy', 'harry', 'hawaii', 'helium', 'high', 'hot', 'hotel',
      'hydrogen', 'idaho', 'illinois', 'india', 'indigo', 'ink', 'iowa',
      'island', 'item', 'jersey', 'jig', 'johnny', 'juliet', 'july', 'jupiter',
      'kansas', 'kentucky', 'kilo', 'king', 'kitten', 'lactose', 'lake', 'lamp',
      'lemon', 'leopard', 'lima', 'lion', 'lithium', 'london', 'louisiana',
      'low', 'magazine', 'magnesium', 'maine', 'mango', 'march', 'mars',
      'maryland', 'massachusetts', 'may', 'mexico', 'michigan', 'mike',
      'minnesota', 'mirror', 'mississippi', 'missouri', 'mobile', 'mockingbird',
      'monkey', 'montana', 'moon', 'mountain', 'muppet', 'music', 'nebraska',
      'neptune', 'network', 'nevada', 'nine', 'nineteen', 'nitrogen', 'north',
      'november', 'nuts', 'october', 'ohio', 'oklahoma', 'one', 'orange',
      'oranges', 'oregon', 'oscar', 'oven', 'oxygen', 'papa', 'paris', 'pasta',
      'pennsylvania', 'pip', 'pizza', 'pluto', 'potato', 'princess', 'purple',
      'quebec', 'queen', 'quiet', 'red', 'river', 'robert', 'robin', 'romeo',
      'rugby', 'sad', 'salami', 'saturn', 'september', 'seven', 'seventeen',
      'shade', 'sierra', 'single', 'sink', 'six', 'sixteen', 'skylark', 'snake',
      'social', 'sodium', 'solar', 'south', 'spaghetti', 'speaker', 'spring',
      'stairway', 'steak', 'stream', 'summer', 'sweet', 'table', 'tango', 'ten',
      'tennessee', 'tennis', 'texas', 'thirteen', 'three', 'timing', 'triple',
      'twelve', 'twenty', 'two', 'uncle', 'undress', 'uniform', 'uranus', 'utah',
      'vegan', 'venus', 'vermont', 'victor', 'video', 'violet', 'virginia',
      'washington', 'west', 'whiskey', 'white', 'william', 'winner', 'winter',
      'wisconsin', 'wolfram', 'wyoming', 'xray', 'yankee', 'yellow', 'zebra',
      'zulu'
  ]

  # Make a digest human-readable
  #
  # Example:
  #   >> HumanDigest.humanize('60ad8d0d871b6095808297)
  #   => sodium-magnesium-nineteen-hydrogen
  #
  # Arguments:
  #   hexdigest: (String)
  #   words: (Integer)
  #   separator: (String)

  def self.humanize(hexdigest, words=4, separator='-')
    hexdigest = hexdigest.to_s unless hexdigest.respond_to?(:length) and hexdigest.respond_to?(:unpack)
  	limit = hexdigest.length / 2
  	unpack_format = 'A2' * limit
  	bytes = hexdigest.unpack(unpack_format).collect { |x| x.hex }
  	compressed = compress(bytes, words)
  	return (compressed.collect { |x| @word_list[x] }).join(separator)
  end

  # Compress a byte array into a shorter length
  #
  # Example:
  #   >> HumanDigest.compress([96, 173, 141, 13, 135, 27, 96, 149, 128, 130, 151])
  #   => [205, 128, 156, 96]
  #
  # Arguments:
  #   bytes: (Array)
  #   target: (Integer)

  def self.compress(bytes, target)
  	bytes_copy = bytes.clone
  	length = bytes_copy.length
  	seg_size = (length / target).floor
  	segments = []
  	target.times { segments.push(bytes_copy.slice!(0, seg_size)) }
  	segments[-1].concat(bytes_copy)
  	checksums = segments.collect { |a| a.reduce(:^) }
  	return checksums
  end

end
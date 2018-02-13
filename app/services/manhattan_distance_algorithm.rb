class ManhattanDistanceAlgorithm
  NAME = 'ManhattanDist'
  K_NN = 3

  def initialize(opts = {})
    validate(opts)
    @height = opts[:height]
    @weight = opts[:weight]
    @tastes = opts[:tastes]
    @preference = 0
    @confidence = 0
  end

  def validate(opts)
    raise ArgumentError, 'height' unless opts[:height].is_a? Numeric
    raise ArgumentError, 'weight' unless opts[:weight].is_a? Numeric
    raise ArgumentError, 'tastes' unless opts[:tastes] != nil
  end

  def preference
    @preference
  end

  def confidence
    @confidence
  end

  def perform
    results = Array.new(@tastes.size)

    # Calculate distance for each taste item
    i = 0
    @tastes.each do |taste|
      total_distance  = (@height - taste.height).abs + (@weight - taste.weight).abs
      results[i] = [total_distance, taste.preference]
      i = i + 1
    end

    # Sort so that closest items are at the top of the list
    results = results.sort_by{|x,y|x}

    # Safety precaution, just in case there aren't enough Taste items
    stop = (K_NN > results.size) ? results.size : K_NN

    # Examine k-nearest neighbors and calculate a weighted preference score
    # based on distance to our target height/weight
    preference_score = 0
    0.upto(stop-1) do |i|
      preference_score += calculate_weighted_value(results[i][0], results[i][1])
    end

    # Positive means the target is in a CAT neighborhood.
    # Negative means the target is in a DOG neighborhood.
    # Zero (rare) will result in a guess of DOG as most people
    # favor dogs according to various stats on the Internet.
    if preference_score > 0
      @preference = Taste::PREFERENCE_CAT
    else
      @preference = Taste::PREFERENCE_DOG
    end

    # Calculate a confidence metric
    @confidence = preference_score.abs / K_NN

    # Debug Output
    print "\n***Manhattan Distance Algorithm***\n"
    print "Height: #{@height}\", Weight: #{@weight} lbs\n"
    print "Pref Score: #{preference_score}, Confidence: #{@confidence}\n"
    results.each do |list|
      print "#{list[0]} => #{list[1]} => #{calculate_weighted_value(list[0], list[1])}\n"
    end

  end

protected

  def calculate_weighted_value(distance, value)
    #Avoid division by zero
    if distance == 0
      return 1 * value
    else
      return (1/distance) * value
    end
  end
end

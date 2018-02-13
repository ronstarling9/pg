class RandomGuessAlgorithm
  NAME = 'RandomGuess'

  def initialize(opts = {})
    validate(opts)
    @preference = 0
    @confidence = 0.5
    @choices = [Taste::PREFERENCE_DOG, Taste::PREFERENCE_CAT]
  end

  def validate(opts)
    # nothing to validate
  end

  def preference
    @preference
  end

  def confidence
    @confidence
  end

  def perform
    @preference = @choices.sample
  end
end

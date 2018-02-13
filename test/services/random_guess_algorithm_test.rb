require 'test_helper'

class RandomGuessAlgorithmTest < ActiveSupport::TestCase
  CONFIDENCE_PCT = 0.5

  test "guess" do
    algorithm = RandomGuessAlgorithm.new
    algorithm.perform

    assert algorithm.preference == Taste::PREFERENCE_CAT || algorithm.preference == Taste::PREFERENCE_DOG
    assert algorithm.confidence == CONFIDENCE_PCT, "confidence should be #{CONFIDENCE_PCT}"
  end

end

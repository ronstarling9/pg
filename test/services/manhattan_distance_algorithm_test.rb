require 'test_helper'

class ManhattanDistanceAlgorithmTest < ActiveSupport::TestCase
  SMALL_HEIGHT_INCHES = 54
  SMALL_WEIGHT_POUNDS = 95
  BIG_HEIGHT_INCHES = 78
  BIG_WEIGHT_POUNDS = 245
  MEDIUM_HEIGHT_INCHES = 66
  MEDIUM_WEIGHT_POUNDS = 150

  test "init" do
    assert_raise ArgumentError do
    algorithm = ManhattanDistanceAlgorithm.new({
      #height: SMALL_HEIGHT_INCHES,
      weight: SMALL_WEIGHT_POUNDS,tastes: Taste.all })
    end

    assert_raise ArgumentError do
    algorithm = ManhattanDistanceAlgorithm.new({
      height: SMALL_HEIGHT_INCHES,
      #weight: SMALL_WEIGHT_POUNDS,
      tastes: Taste.all })
    end

    assert_raise ArgumentError do
    algorithm = ManhattanDistanceAlgorithm.new({
      height: SMALL_HEIGHT_INCHES,
      weight: SMALL_WEIGHT_POUNDS,
      #Missing Tastes
      })
    end
  end

  test "guess default when no tastes" do
    print "\nDefault\n"

    algorithm = ManhattanDistanceAlgorithm.new({
      height: SMALL_HEIGHT_INCHES,
      weight: SMALL_WEIGHT_POUNDS,
      tastes: [] })

    algorithm.perform
    pet_value = algorithm.preference

    assert pet_value == Taste::PREFERENCE_DOG , "should guess dog"
    assert algorithm.confidence == 0
  end


  test "guess cat" do
    print "\nSmall Person\n"

    algorithm = ManhattanDistanceAlgorithm.new({
      height: SMALL_HEIGHT_INCHES,
      weight: SMALL_WEIGHT_POUNDS,
      tastes: Taste.all })

    algorithm.perform
    pet_value = algorithm.preference

    assert pet_value == Taste::PREFERENCE_CAT , "should guess cat"
    assert algorithm.confidence >= 0
  end

  test "guess dog" do
    print "\nBig Person\n"

    algorithm = ManhattanDistanceAlgorithm.new({
      height: BIG_HEIGHT_INCHES,
      weight: BIG_WEIGHT_POUNDS,
      tastes: Taste.all })

    algorithm.perform
    pet_value = algorithm.preference

    assert pet_value == Taste::PREFERENCE_DOG, "should guess dog"
    assert algorithm.confidence >= 0
  end

  test "guess either" do
    print "\nMedium Person\n"

    algorithm = ManhattanDistanceAlgorithm.new({
      height: MEDIUM_HEIGHT_INCHES,
      weight: MEDIUM_WEIGHT_POUNDS,
      tastes: Taste.all })

    algorithm.perform
    pet_value = algorithm.preference

    assert pet_value == Taste::PREFERENCE_CAT || pet_value == Taste::PREFERENCE_DOG
    assert algorithm.confidence >= 0
  end
end

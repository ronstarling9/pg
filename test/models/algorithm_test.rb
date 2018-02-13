require 'test_helper'

class AlgorithmTest < ActiveSupport::TestCase

  setup do
    @algorithm        = Algorithm.new
    @algorithm.name   = 'TestAlgorithm'
    @algorithm.weight = 50
  end

  test "required all attributes" do
    assert @algorithm.valid?
    assert @algorithm.errors.count == 0
  end

  test "required attribute name" do
    @algorithm.name = nil
    assert_not @algorithm.valid?, 'name is missing'
  end

  test "required attribute weight" do
    @algorithm.weight = nil
    assert_not @algorithm.valid?, 'weight is missing'
  end

  test "weight numericality" do
    @algorithm.weight = 1.001
    assert_not @algorithm.valid?, 'weight not integer'
  end

  test "weight range" do
    @algorithm.weight = Algorithm::WEIGHT_LOWER_LIMIT - 1
    assert_not @algorithm.valid?, 'weight out of range'

    @algorithm.weight = Algorithm::WEIGHT_UPPER_LIMIT + 1
    assert_not @algorithm.valid?, 'weight out of range'
  end

  test "should save valid object" do
    assert @algorithm.save
  end

  test "find all" do
    @algorithms = Algorithm.all
    assert @algorithms.size > 0
  end
end

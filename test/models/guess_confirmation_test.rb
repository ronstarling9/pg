require 'test_helper'

class GuessConfirmationTest < ActiveSupport::TestCase
  setup do
    @gc = GuessConfirmation.new
    @gc.height     = 68
    @gc.weight     = 150
    @gc.guess      = 'dog'
    @gc.algorithm  = 'Coin Flip'
    @gc.is_correct = true
  end

  test "required all attributes" do
    assert @gc.valid?
  end

  test "required attribute height" do
    @gc.height = nil
    assert_not @gc.valid?, 'height is missing'
  end

  test "required attribute weight" do
    @gc.weight = nil
    assert_not @gc.valid?, 'weight is missing'
  end

  test "required attribute guess" do
    @gc.guess = nil
    assert_not @gc.valid?, 'guess is missing'
  end

  test "required attribute algorithm" do
    @gc.algorithm = nil
    assert_not @gc.valid?, 'algorithm is missing'
  end

  test "required attribute is_correct" do
    @gc.is_correct = nil
    assert_not @gc.valid?, 'is_correct is missing'
  end

  test "numericality" do
    @gc.height = 'tall'
    @gc.weight = 150
    assert_not @gc.valid?, 'height should be number'

    @gc.height = 68
    @gc.weight = 'pounds'
    assert_not @gc.valid?, 'weight should be number'
  end

  test "height range" do
    @gc.height = 47
    @gc.weight = 150
    assert_not @gc.valid?, 'height out of range'

    @gc.height = 85
    assert_not @gc.valid?, 'height out of range'

  end

  test "weight range" do
    @gc.height = 68
    @gc.weight = 79
    assert_not @gc.valid?, 'weight out of range'

    @gc.weight = 301
    assert_not @gc.valid?, 'weight out of range'
  end

end

require 'test_helper'

class TasteTest < ActiveSupport::TestCase
  TASTE_FIXTURE_RECORD_COUNT = 150

  setup do
    @taste_cat            = Taste.new
    @taste_cat.height     = 62
    @taste_cat.weight     = 120
    @taste_cat.preference = Taste::PREFERENCE_CAT
  end

  test "required all attributes" do
    assert @taste_cat.valid?
    assert @taste_cat.errors.count == 0
  end

  test "required attribute height" do
    @taste_cat.height = nil
    assert_not @taste_cat.valid?, 'height is missing'
  end

  test "required attribute weight" do
    @taste_cat.weight = nil
    assert_not @taste_cat.valid?, 'weight is missing'
  end

  test "required attribute preference" do
    @taste_cat.preference = nil
    assert_not @taste_cat.valid?, 'preference is missing'
  end

  test "height and weight numericality" do
    @taste_cat.height = 'tall'
    assert_not @taste_cat.valid?, 'height should be number'

    @taste_cat.height = 68
    @taste_cat.weight = 'pounds'
    assert_not @taste_cat.valid?, 'weight should be number'
  end

  test "preference numericality" do
    @taste_cat.preference = 0
    assert_not @taste_cat.valid?, 'preference invalid value'

    @taste_cat.preference = 1.001
    assert_not @taste_cat.valid?, 'preference not integer'
  end

  test "height range" do
    @taste_cat.height = Taste::HEIGHT_LOWER_LIMIT_INCHES - 1
    assert_not @taste_cat.valid?, 'height out of range'

    @taste_cat.height = Taste::HEIGHT_UPPER_LIMIT_INCHES + 1
    assert_not @taste_cat.valid?, 'height out of range'

  end

  test "weight range" do
    @taste_cat.weight = Taste::WEIGHT_LOWER_LIMIT_POUNDS - 1
    assert_not @taste_cat.valid?, 'weight out of range'

    @taste_cat.weight = Taste::WEIGHT_UPPER_LIMIT_POUNDS + 1
    assert_not @taste_cat.valid?, 'weight out of range'
  end

  test "should save valid object" do
    assert @taste_cat.save
  end

  test "find all" do
    @tastes = Taste.all
    assert_equal TASTE_FIXTURE_RECORD_COUNT, @tastes.size
  end

end

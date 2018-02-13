require 'test_helper'

class GuessCriteriumTest < ActiveSupport::TestCase

  test "required attributes" do
    guessCriterium = GuessCriterium.new
    guessCriterium.height = 68
    guessCriterium.weight = 150
    assert guessCriterium.valid?

    guessCriterium.height = nil
    guessCriterium.weight = 150
    assert_not guessCriterium.valid?, 'height is missing'

    guessCriterium.height = 68
    guessCriterium.weight = nil
    assert_not guessCriterium.valid?, 'weight is missing'
  end

  test "numericality" do
    guessCriterium = GuessCriterium.new
    guessCriterium.height = 'tall'
    guessCriterium.weight = 150
    assert_not guessCriterium.valid?, 'height should be number'

    guessCriterium.height = 68
    guessCriterium.weight = 'pounds'
    assert_not guessCriterium.valid?, 'weight should be number'
  end

  test "height range" do
    guessCriterium = GuessCriterium.new
    guessCriterium.height = 47
    guessCriterium.weight = 150
    assert_not guessCriterium.valid?, 'height out of range'

    guessCriterium.height = 85
    assert_not guessCriterium.valid?, 'height out of range'

  end

  test "weight range" do
    guessCriterium = GuessCriterium.new
    guessCriterium.height = 68
    guessCriterium.weight = 79
    assert_not guessCriterium.valid?, 'weight out of range'

    guessCriterium.weight = 301
    assert_not guessCriterium.valid?, 'weight out of range'
  end

end

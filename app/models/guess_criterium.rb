class GuessCriterium < ApplicationRecord
  validates :height, :weight, presence: true

  validates :height, numericality: {
    greater_than_or_equal_to: Taste::HEIGHT_LOWER_LIMIT_INCHES,
    less_than_or_equal_to: Taste::HEIGHT_UPPER_LIMIT_INCHES }

  validates :weight, numericality: {
    greater_than_or_equal_to: Taste::WEIGHT_LOWER_LIMIT_POUNDS,
    less_than_or_equal_to: Taste::WEIGHT_UPPER_LIMIT_POUNDS }
end

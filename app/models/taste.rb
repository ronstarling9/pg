class Taste < ApplicationRecord
  PREFERENCE_DOG = -1
  PREFERENCE_CAT = 1
  HEIGHT_LOWER_LIMIT_INCHES = 48
  HEIGHT_UPPER_LIMIT_INCHES = 84
  WEIGHT_LOWER_LIMIT_POUNDS = 80
  WEIGHT_UPPER_LIMIT_POUNDS = 300

  validates :height, :weight, :preference, presence: true
  validates :preference, numericality: { only_integer: true }
  validates :preference, inclusion: { in: [PREFERENCE_DOG, PREFERENCE_CAT] }
  validates :height, numericality: { greater_than_or_equal_to:HEIGHT_LOWER_LIMIT_INCHES, less_than_or_equal_to:HEIGHT_UPPER_LIMIT_INCHES }
  validates :weight, numericality: { greater_than_or_equal_to:WEIGHT_LOWER_LIMIT_POUNDS, less_than_or_equal_to:WEIGHT_UPPER_LIMIT_POUNDS }
end

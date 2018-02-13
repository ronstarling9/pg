class Algorithm < ApplicationRecord
  WEIGHT_LOWER_LIMIT = 0
  WEIGHT_UPPER_LIMIT = 100

  validates :name, :weight, presence: true
  validates :name, length: { maximum: 15 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to:WEIGHT_LOWER_LIMIT, less_than_or_equal_to:WEIGHT_UPPER_LIMIT }
end

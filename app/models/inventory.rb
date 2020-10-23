class Inventory < ApplicationRecord
  belongs_to :phone
  belongs_to :user

  validates_numericality_of :quantity, less_than_or_equal_to: 10_000
end

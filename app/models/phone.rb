class Phone < ApplicationRecord
  belongs_to :model
  has_many :inventories

  validates :body_color, :data_memory, presence: true
  validates_numericality_of :price, less_than_or_equal_to: 1_000_000
end

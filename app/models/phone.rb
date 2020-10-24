class Phone < ApplicationRecord
  belongs_to :model
  has_many :inventories

  has_attached_file :main_photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :main_photo, content_type: /\Aimage\/.*\z/

  validates :body_color, :data_memory, presence: true
  validates_numericality_of :price, less_than_or_equal_to: 1_000_000
end

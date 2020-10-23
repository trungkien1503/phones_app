class Model < ApplicationRecord
  belongs_to :manufacturer
  has_many :phones, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :os_version, presence: true
  validates :year_of_manufacture, numericality: { only_integer: true }
end

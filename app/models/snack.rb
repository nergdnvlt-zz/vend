class Snack < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  belongs_to :machine
end

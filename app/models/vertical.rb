class Vertical < ApplicationRecord
  has_one :category, dependent: :nullify

  validates :name, presence: true
end

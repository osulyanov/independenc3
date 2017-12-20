class Vertical < ApplicationRecord
  has_many :categories, dependent: :nullify

  validates :name, presence: true
end

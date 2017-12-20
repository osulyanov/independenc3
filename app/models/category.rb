class Category < ApplicationRecord
  enum state: { inactive: 0, active: 1 }

  belongs_to :vertical
  has_many :courses, dependent: :nullify

  validates :name, presence: true
end

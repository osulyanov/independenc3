class Category < ApplicationRecord
  enum state: { inactive: 0, active: 1 }

  belongs_to :vertical

  validates :name, presence: true
end

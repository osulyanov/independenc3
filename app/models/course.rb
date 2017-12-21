class Course < ApplicationRecord
  enum state: { inactive: 0, active: 1 }

  belongs_to :category

  validates :name, presence: true
  validates :author, presence: true
end

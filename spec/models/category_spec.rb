require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to(:vertical) }
  it { should have_many(:courses) }

  it { should validate_presence_of(:name) }
end

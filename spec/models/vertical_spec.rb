require 'rails_helper'

RSpec.describe Vertical, type: :model do
  it { should have_many(:categories).dependent(:nullify) }

  it { should validate_presence_of(:name) }
end

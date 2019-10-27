require 'rails_helper'

RSpec.describe Content, type: :model do
  task = FactoryBot.build(:content)
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }
  it { should validate_presence_of(:type) }
end

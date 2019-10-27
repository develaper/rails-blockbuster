require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'validations' do
    context 'presence' do
      purchase = FactoryBot.build(:purchase)
      it { should validate_presence_of(:price) }
      it { should validate_presence_of(:quality) }
      it { should validate_presence_of(:status) }
    end
  end
end

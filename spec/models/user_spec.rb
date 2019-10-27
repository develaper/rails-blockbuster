require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'presence' do
      user = FactoryBot.create(:user)
      it { should validate_presence_of(:email) }
    end
    context 'uniqueness' do
      subject { FactoryBot.create(:user, email:Faker::Internet.email ) }
      it { should validate_uniqueness_of(:email) }
    end
  end
end

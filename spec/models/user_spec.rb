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
  describe 'library' do
    context 'with no purchases' do
      it 'retrieves zero' do
        user = FactoryBot.create(:user)
        expect(user.library.count).to eq(0)
      end
    end
    context 'with alive purchases' do
      it 'retrives all purchases' do
        user = FactoryBot.create(:user)
        content_list = FactoryBot.create_list(:content,3)
        purchase1 = FactoryBot.create(:purchase, status: 'alive', content: content_list[0], user: user)
        purchase2 = FactoryBot.create(:purchase, status: 'alive', content: content_list[1], user: user)
        purchase3 = FactoryBot.create(:purchase, status: 'alive', content: content_list[2], user: user)
        expect(user.library.count).to eq(3)
        expect(user.library).to include(purchase1, purchase2, purchase3)
      end
    end
    context 'with alive and expired purchases' do
      it 'retrives only alive purchases' do
        user = FactoryBot.create(:user)
        content_list = FactoryBot.create_list(:content,3)
        purchase1 = FactoryBot.create(:purchase, status: 'alive', content: content_list[0], user: user)
        purchase2 = FactoryBot.create(:purchase, status: 'alive', content: content_list[1], user: user)
        purchase3 = FactoryBot.create(:purchase, status: 'expired', content: content_list[2], user: user)
        expect(user.library.count).to eq(2)
        expect(user.library).to include(purchase1, purchase2)
      end
    end
  end
end

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
  describe 'validate uniqueness to avoid duplication' do
    before(:all) do
      @user = FactoryBot.create(:user)
      @content = FactoryBot.create(:content)
      @purchase_alive = FactoryBot.build(:purchase, status: 'alive', content: @content, user: @user)
    end
    context 'there is non existing previous purchase for the content' do
      it 'passes successfully' do
        expect(@purchase_alive.validate_purchase_uniqueness).to be_truthy
      end
    end
    context 'there is a previous purchase for the content already expired' do
      it 'passes successfully' do
        purchase_expìred = FactoryBot.create(:purchase, status: 'expired', content: @content, user: @user)
        expect(@purchase_alive.validate_purchase_uniqueness).to be_truthy
      end
    end
    context 'there is a previous purchase alive for the content' do
      it 'passes successfully' do
        previous_purchase_alive = FactoryBot.create(:purchase, status: 'alive', content: @content, user: @user)
        expect(@purchase_alive.validate_purchase_uniqueness).to be false
      end
    end
  end
end

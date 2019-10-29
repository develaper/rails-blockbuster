require "rails_helper"

describe Api::V1::PurchasesController , :type => :controller do
  context "index" do
    it 'sends a list with all purchases' do
      @user = FactoryBot.create(:user)
      content_list = FactoryBot.create_list(:content, 5)
      content_list.each do |content|
        new_purchase = FactoryBot.create(:purchase, user: @user, content: content)
      end
      get :index , params: { user_id: @user.id, format: :json }
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json.count).to eq(@user.purchases.alive.count)
    end
  end
  context "create" do
    it 'adds new purchase with the right params' do
      @user = FactoryBot.create(:user)
      @content = FactoryBot.create(:content)

      post :create , params: { user_id: @user.id, content_id: @content.id, format: :json }
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json['id']).to eq(@user.purchases.alive.last.id)

    end
  end
end

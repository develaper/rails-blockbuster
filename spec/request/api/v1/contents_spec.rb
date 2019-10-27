require "rails_helper"

describe Api::V1::ContentsController , :type => :controller do
  context "index" do
    it 'sends a list with all contents' do
      FactoryBot.create_list(:content, 10)
      get :index, format: :json
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json.count).to eq(Content.all.count)
    end
    it 'sends a list with all movies' do
      FactoryBot.create_list(:content, 5, category: 'movie')
      get :index, :params => { :category => 'movie' , format: :json }
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json.count).to eq(Content.all.where(category:'movie').count)
    end
    it 'sends a list with all seasons and its episodes' do
      season = FactoryBot.create(:content, category: 'season')
      episode = FactoryBot.create(:episode, content: season)
      get :index, :params => { :category => 'season' , format: :json }
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json.count).to eq(Content.all.where(category:'season').count)
      expect(response.body).to include(episode.title)
    end
  end
end

require 'rails_helper'

RSpec.describe Content, type: :model do
  describe 'validations' do
    context 'presence' do
      content = FactoryBot.build(:content)
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:plot) }
      it { should validate_presence_of(:category) }
    end
  end

  describe 'number of episodes' do
    context 'when  content is a movie' do
      it 'returns nil' do
        content = FactoryBot.build(:content)
        content.category = "movie"
        expect(content.number_of_episodes).to be_nil
      end
    end
    context 'when  content is a season' do
      it 'returns 0 if there are no episodes' do
        content = FactoryBot.build(:content)
        content.category = "season"
        expect(content.number_of_episodes).to eq(0)
      end
      it 'returns the number of episodes' do
        content = FactoryBot.build(:content)
        content.category = "season"
        episodes = FactoryBot.create_list(:episode, 5, content: content)
        expect(content.number_of_episodes).to eq(episodes.count)
      end
    end
  end


end

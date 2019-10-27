require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'validations' do
    context 'presence' do
      episode = FactoryBot.build(:episode)
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:plot) }
      it { should validate_presence_of(:number) }
    end
  end
end

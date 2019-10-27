class Episode < ApplicationRecord
  belongs_to :content, -> { where(category: :season) }
  validates_presence_of [:title, :plot, :number]
end

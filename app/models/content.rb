class Content < ApplicationRecord
  enum category: [:movie, :season]
  validates_presence_of [:title, :plot, :category]
  has_many :episodes, -> { order "number ASC" }

  def number_of_episodes
    return nil unless self.season?
    episodes.count
  end
end

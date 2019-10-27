class Content < ApplicationRecord
  enum type: [:movie, :season]
  validates_presence_of [:title, :plot, :type]
end

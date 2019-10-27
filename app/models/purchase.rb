class Purchase < ApplicationRecord
  enum quality: [:HD, :SD]
  enum status:  [:alive, :expired]

  belongs_to :content
  belongs_to :user

  validates_presence_of [:price, :quality, :status]
end

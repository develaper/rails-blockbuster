class Purchase < ApplicationRecord
  enum quality: [:HD, :SD]
  enum status:  [:alive, :expired]

  belongs_to :content
  belongs_to :user

  validates_presence_of [:price, :quality, :status]

  before_create :validate_purchase_uniqueness 

  def validate_purchase_uniqueness
    !Purchase.alive.where(:user => user, :content => content).any?
  end
end

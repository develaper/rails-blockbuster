class Purchase < ApplicationRecord
  enum quality: [:HD, :SD]
  enum status:  [:alive, :expired]

  belongs_to :content
  belongs_to :user

  validates_presence_of [:price, :quality, :status]

  before_create :validate_purchase_uniqueness, :set_expiration_date

  def validate_purchase_uniqueness
    throw(:abort) if Purchase.alive.where(:user => user, :content => content).any?
  end

  def set_expiration_date
    self.expires_at = created_at + 2.days
  end
end

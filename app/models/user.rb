class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :purchases, -> { order "expires_at ASC" }

  def library
    purchases.select("id, expires_at, content_id").alive.includes(:content).all
  end
end

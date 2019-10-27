class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :purchases

  def library
    purchases.alive
  end
end

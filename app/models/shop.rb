class Shop < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :reported_users, through: :reports, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :hotpepper_id, presence: true
end

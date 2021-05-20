class User < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :reported_shops, through: :reports, source: :shop

  has_many :likes, dependent: :destroy
  has_many :liked_shops, through: :likes, source: :shop

  validates :uid, presence: true
  validates :name, presence: true

  def liked?(shop)
    likes.where(shop_id: shop.id).any?
  end
end

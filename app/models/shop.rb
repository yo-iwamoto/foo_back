class Shop < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :reported_users, through: :reports, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :hotpepper_id, presence: true
  
  def isLikedBy(user)
    likes.where(user_id: user.id).any?
  end

  def isReportedBy(user)
    reports.where(user_id: user.id).any?
  end

  def likesCount
    likes.count
  end

  def reportsCount
    reports.count
  end
end

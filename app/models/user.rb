class User < ApplicationRecord
  has_one_attached :photo, dependent: :destroy
  has_one_attached :coverImage, dependent: :destroy
  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followed, class_name: 'Following', foreign_key: 'followed_id'
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates_uniqueness_of :email, :userName
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :fullName, :userName, :email, :password, :password_confirmation

  def friends_and_own_opinions
    Opinion.where(user: (followed.to_a << self))
  end
end

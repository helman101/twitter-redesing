class User < ApplicationRecord
  has_one_attached :photo, dependent: :destroy
  has_one_attached :coverImage, dependent: :destroy
  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :followings, foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :followings
  has_many :followed, through: :followings
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates_uniqueness_of :email, :userName
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :fullName, :userName, :email, :password, :password_confirmation

  def friends_and_own_opinions
    Opinions.where(user: (followed.to_a << self))
  end
end

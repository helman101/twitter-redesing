class User < ApplicationRecord
  has_one_attached :photo
  has_one_attached :coverImage
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates_uniqueness_of :email, :userName
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_precense_of :fullName, :userName, :email, :password, :password_confirmation

end

class Following < ApplicationRecord
  belongs_to :users

  validates_presence_of :follower_id, :followed_id
end

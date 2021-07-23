class Following < ApplicationRecord
  belongs_to :users

  validate_precense_of :follower_id, :followed_id
end

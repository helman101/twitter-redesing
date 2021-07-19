class Following < ApplicationRecord
  validate_precense_of :follower_id, :followed_id
end

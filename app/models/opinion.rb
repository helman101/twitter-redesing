class Opinion < ApplicationRecord
  validate :content, length: { in: 1..150 }
  validate_precense_of :content, :author_id
end

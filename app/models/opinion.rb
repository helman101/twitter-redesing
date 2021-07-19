class Opinion < ApplicationRecord
  validate_precense_of :content, :author_id
end

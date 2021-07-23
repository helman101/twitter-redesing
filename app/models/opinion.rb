class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :content, length: { in: 1..150 }
  validates_presence_of :content, :author_id
end

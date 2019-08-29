class Review < ApplicationRecord
  belongs_to :doctor

  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }
end

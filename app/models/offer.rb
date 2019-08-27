class Offer < ApplicationRecord
  belongs_to :doctor
  has_many :consultations
  belongs_to :specialty
end

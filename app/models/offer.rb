class Offer < ApplicationRecord
  belongs_to :doctor
  has_many :consultations, dependent: :destroy
  belongs_to :specialty

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :specialty_id, presence: true

end

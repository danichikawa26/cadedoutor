class Offer < ApplicationRecord
  attr_accessor :date_range
  belongs_to :doctor
  has_many :consultations, dependent: :destroy
  belongs_to :specialty

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :specialty_id, presence: true

  validate :date_validation

  def date_validation
    if self[:end_date] < self[:start_date]
      errors[:end_date] << "Invalid date"
      return false
    else
      return true
    end
  end
end

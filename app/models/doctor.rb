class Doctor < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  # has_many :consultations, through: :offers
  has_many :doctor_specialties
  has_many :specialties, through: :doctor_specialties

  validates :professional_register, presence: true, uniqueness: true
  validates :address, presence: true
end

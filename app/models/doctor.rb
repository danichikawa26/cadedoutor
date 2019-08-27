class Doctor < ApplicationRecord
  belongs_to :user
  has_many :offers
  # has_many :consultations, through: :offers
  has_many :doctor_specialties
  has_many :specialties, through: :doctor_specialties
end

class Specialty < ApplicationRecord
  has_many :doctor_specialties
  has_many :doctors, class_name: "User", foreign_key: "doctor_id", through: :doctor_specialties
  has_many :offers
  has_many :consultations, through: :offers
end

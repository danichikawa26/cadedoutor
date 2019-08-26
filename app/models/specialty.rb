class Specialty < ApplicationRecord
  has_many :areas
  has_many :doctors, class_name: "User", foreign_key: "doctor_id", through: :areas
  has_many :offers
  has_many :consultations, through: :offers
end

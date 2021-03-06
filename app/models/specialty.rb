class Specialty < ApplicationRecord
  has_many :doctor_specialties
  has_many :doctors, through: :doctor_specialties
  has_many :offers

  validates :name, presence: true, uniqueness: true
end

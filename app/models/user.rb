class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :areas
  has_many :specialties, through: :areas
  has_many :patient_consultations, inverse_of: :patient, class_name: "Consultation", foreign_key: "patient_id"
  has_many :offers, inverse_of: :doctor, foreign_key: "doctor_id"
  has_many :doctor_consultations, class_name: "Consultation", through: :offers
end

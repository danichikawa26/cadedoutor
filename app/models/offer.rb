class Offer < ApplicationRecord
  belongs_to :doctor, class_name: "User", foreign_key: "doctor_id"
  has_one :consultation
  belongs_to :specialty
end

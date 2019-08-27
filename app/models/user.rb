class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :email, uniqueness: true, presence: true
  validates :city, presence: true

  belongs_to :doctor, dependent: :destroy, optional: true
  has_many :consultations, dependent: :destroy

  # before_destroy :destroy_doctor, prepend: true

  # private

  # def destroy_doctor
  #   self.doctor.destroy
  # end

end

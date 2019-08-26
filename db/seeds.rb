# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Deleting database'

User.destroy_all
Specialty.destroy_all
Offer.destroy_all
Consultation.destroy_all
DoctorSpecialty.destroy_all

puts 'Creating data'

ophthalmology = Specialty.create!(name: 'ophthalmology')
eye_doctor = User.create!(first_name: 'John', last_name: 'Doe', is_doctor: true, email: 'danielaichikawa@gmail.com', password: 'senha1234')
DoctorSpecialty.new(doctor: eye_doctor, specialty: ophthalmology)
lucas = User.create!(first_name: 'Lucas', last_name: 'Sandeville', email: 'lucas@gmail.com', password: 'senha123')
first_offer = Offer.create!(doctor: eye_doctor, specialty: ophthalmology)
Consultation.create!(patient: lucas, offer: first_offer)

puts 'Successful'

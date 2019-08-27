# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'
require 'faker'

puts 'Deleting data from database'

Consultation.destroy_all
DoctorSpecialty.destroy_all
Specialty.destroy_all
# Offer.destroy_all
# Doctor.destroy_all
User.destroy_all


puts 'Creating fulano, ciclana, beltrana and futrano'
puts '----------------------------------------------------------'

all_specialties = ["Abdominal Radiology", "Addiction Psychiatry", "Adolescent Medicine", "Adult Cardiothoracic Anesthesiology", "Adult Reconstructive Orthopaedics", "Advanced Heart Failure & Transplant Cardiology", "Allergy & Immunology", "Anesthesiology", "Biochemical Genetics", "Blood Banking - Transfusion Medicine", "Cardiothoracic Radiology", "Cardiology", "Cardiovascular Disease", "Chemical Pathology", "Child & Adolescent Psychiatry", "Child Abuse Pediatrics", "Child Neurology", "Clinical & Laboratory Immunology", "Clinical Cardiac Electrophysiology", "Clinical Neurophysiology", "Colon & Rectal Surgery", "Congenital Cardiac Surgery", "Craniofacial Surgery", "Critical Care Medicine", "Critical Care Medicine", "Cytopathology", "Dermatology", "Dermatopathology", "Developmental-Behavioral Pediatrics", "Emergency Medicine", "Endocrinology, Diabetes & Metabolism", "Endovascular Surgical Neuroradiology", "Endovascular Surgical Neuroradiology", "Endovascular Surgical Neuroradiology", "Family Medicine", "Female Pelvic Medicine & Reconstructive Surgery", "Foot & Ankle Orthopaedics", "Forensic Pathology", "Forensic Psychiatry", "Gastroenterology", "Geriatric Medicine", "Geriatric Medicine", "Geriatric Medicine", "Geriatric Psychiatry", "Hand Surgery", "Hand Surgery", "Hand Surgery", "Hematology", "Hematology", "Hematology & Oncology", "Infectious Disease", "Internal Medicine", "Internal Medicine-Pediatrics", "Interventional Cardiology", "Medical Genetics", "Medical Microbiology", "Medical Toxicology", "Medical Toxicology", "Molecular Genetic Pathology", "Muscoskeletal Radiology", "Musculoskeletal Oncology", "Neonatal-Perinatal Medicine", "Nephrology", "Neurological Surgery", "Neurology", "Neuromuscular Medicine", "Neuromuscular Medicine", "Neuropathology", "Neuroradiology", "Nuclear Medicine", "Nuclear Radiology", "Obstetric Anesthesiology", "Obstetrics & Gynecology", "Oncology", "Ophthalmic Plastic & Reconstructive Surgery", "Ophthalmology", "Orthopaedic Sports Medicine", "Orthopaedic Surgery", "Orthopaedic Surgery of the Spine", "Orthopaedic Trauma", "Otolaryngology", "Otology - Neurotology", "Pain Medicine", "Pain Medicine", "Pain Medicine", "Pathology-Anatomic & Clinical", "Pediatric Anesthesiology", "Pediatric Cardiology", "Pediatric Critical Care Medicine", "Pediatric Emergency Medicine", "Pediatric Emergency Medicine", "Pediatric Endocrinology", "Pediatric Gastroenterology", "Pediatric Hematology-Oncology", "Pediatric Infectious Diseases", "Pediatric Nephrology", "Pediatric Orthopaedics", "Pediatric Otolaryngology", "Pediatric Pathology", "Pediatric Pulmonology", "Pediatric Radiology", "Pediatric Rheumatology", "Pediatric Sports Medicine", "Pediatric Surgery", "Pediatric Transplant Hepatology", "Pediatric Urology", "Pediatrics", "Physical Medicine & Rehabilitation", "Plastic Surgery", "Preventive Medicine", "Procedural Dermatology", "Psychiatry", "Pulmonary Disease", "Pulmonary Disease & Critical Care Medicine", "Radiation Oncology", "Radiology-Diagnostic", "Rheumatology", "Sleep Medicine", "Spinal Cord Injury Medicine", "Sports Medicine", "Sports Medicine", "Sports Medicine", "Sports Medicine", "Surgery-General", "Surgical Critical Care", "Thoracic Surgery", "Thoracic Surgery-Integrated", "Transplant Hepatology", "Urology", "Vascular & Interventional Radiology", "Vascular Surgery"]
all_specialties.each { |spec| Specialty.create(name: spec)}
cardiology = Specialty.find_by(name: 'Cardiology')

fulano = User.new(first_name: 'Fulano', last_name: 'Branquinho', city: 'São Paulo',
  email: 'fulano@cadedoutor.com',password: 'fulano123', doctor: nil)
dr_fulano = Doctor.new(professional_register: '5060258', address: 'Rua da Glória, 195, cj 20', user: fulano)
fulano.doctor = dr_fulano
dr_fulano.specialties = [cardiology]
fulano.save!
dr_fulano.save!

ciclana = User.new(first_name: 'Ciclana', last_name: 'Ichigawa', city: 'São Paulo',
  email: 'ciclana@cadedoutor.com', password: 'ciclana123', doctor: nil)
dr_ciclana = Doctor.new(professional_register: '2585060', address: 'Rua da Vitória, 591, cj 200', user: ciclana)
ciclana.doctor = dr_ciclana
dr_ciclana.specialties = [cardiology]
ciclana.save!
dr_ciclana.save!

beltrana = User.new(first_name: 'Beltrana', last_name: 'Vasconcelos', city: 'São Paulo',
  email: 'beltrana@cadedoutor.com', password: 'beltrana123',doctor: nil)
dr_beltrana = Doctor.new(professional_register: '2586960', address: 'Rua do Sucesso, 519, cj 220', user: beltrana)
beltrana.doctor = dr_beltrana
dr_beltrana.specialties = [cardiology]
beltrana.save!
dr_beltrana.save!

patient = User.create!(first_name: 'Futrano', last_name: 'Coelho', city: 'São Paulo',
  email: 'futrano@cadedoutor.com', password: 'futrano123', doctor: nil)



puts 'fulano, ciclana, beltrana and futrano successfully created'
puts '----------------------------------------------------------'
puts 'populating database with 300 doctors'




  300.times do
    user = User.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, city: 'São Paulo',
    email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8),doctor: nil)

    doctor = Doctor.new(professional_register: "#{8.times { rand(9) }}",
    address: Faker::Address.street_address, user: user)

    random_specialty = Specialty.find(rand(1..115))
    user.doctor = doctor
    doctor.specialties = [random_specialty]
    user.save!
    doctor.save!

    random_boolean = rand() > 0.3 ? true : false
    random_day = rand(1..30)
    random_hour = rand(1..12)
    rand(1..8).times do
      Offer.create(doctor: doctor, specialty: random_specialty, available: random_boolean,
        start_date: DateTime.new(2019,8,random_day,random_hour,0),
        end_date: DateTime.new(2019,8,random_day,random_hour + 1,0)
      )
    end
  end

puts 'database has been fully populated'

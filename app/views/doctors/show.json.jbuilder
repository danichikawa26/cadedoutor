json.doctor do
  json.extract! @doctor, :id
  json.firstName @doctor.user.first_name
  json.lastName @doctor.user.last_name
  json.address @doctor.address
  json.city @doctor.user.city
  json.register @doctor.professional_register
  json.offers @doctor.offers
end

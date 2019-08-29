# json.array! @my_consultations do |consultation|
#   json.extract! consultation, :id
#   json.start consultation.offer.start_date
#   json.end consultation.offer.end_date
#   json.title consultation.offer.specialty.name
# end
json.array! @offers do |offer|
  json.extract! offer, :id
  json.start offer.start_date
  json.end offer.end_date
  json.title offer.specialty.name
  json.update_url doctor_offer_path(offer)
  json.edit_url edit_doctor_offer_path(offer)
end

json.array! @my_consultations do |consultation|
  json.extract! consultation, :id
  json.start consultation.offer.start_date
  json.end consultation.offer.end_date
  json.title consultation.offer.specialty.name
end

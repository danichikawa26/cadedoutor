json.id offer.id
json.title offer.specialty.name
json.start offer.start_date.strftime(date_format)
json.end offer.end_date.strftime(date_format)

json.update_url doctor_offer_path(offer)
json.edit_url edit_doctor_offer_path(offer)

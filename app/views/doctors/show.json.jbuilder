json.doctor do
  json.extract! @doctor, :id
  json.firstName @doctor.user.first_name
  json.lastName @doctor.user.last_name
  json.address @doctor.address
  json.city @doctor.user.city
  json.register @doctor.professional_register
  json.offers @doctor.offers[0..2].sort.reverse

  next_offers = @doctor.offers.select(&:available)
  next_offers = next_offers.select { |offer| offer.specialty == params[:query] } unless params[:query].nil?

  next_offers.sort!.reverse!

  json.offers next_offers[0..2] do |offer|
    json.start_date offer.start_date
    json.end_date offer.end_date
    json.specialty Specialty.find(offer.specialty.id).name
    json.weekday offer.start_date.strftime('%A')
  end
end

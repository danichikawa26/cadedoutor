class ConsultationsController < ApplicationController
  def index
    @consultations = current_user.id.consultations
    @offers = current_user.id.doctor.offers
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
  end
    def create
    @offer = Offer.new(params[:id])
    @consultation = Consultation.new(offer: @offer)
    @consultation.user = current_user
    if @consultation.save!
      @offer.available = false
      @offer.save
      redirect_to consultations_path
    end
  end
end

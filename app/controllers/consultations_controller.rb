class ConsultationsController < ApplicationController
  def create
    @offer = Offer.new(params[:id])
    @consultation = Consultation.new(offer: @offer)
    @consultation.user_id = current_user
    if @consultation.save
      redirect_to consultations_path
  end
end

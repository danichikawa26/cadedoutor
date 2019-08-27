class ConsultationsController < ApplicationController
  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
  end
    def create
    @offer = Offer.new(params[:id])
    @consultation = Consultation.new(offer: @offer)
    @consultation.user_id = current_user
    if @consultation.save
      redirect_to consultations_path
    else
      render :new
    end
  end
end

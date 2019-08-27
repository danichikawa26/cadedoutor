class ConsultationsController < ApplicationController
  before_action :redirect_visitor

  def index
    @consultations = current_user.consultations
    @offers = current_user.doctor.offers unless current_user.doctor.nil?
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

  private

  def redirect_visitor
    redirect_to doctors_path unless user_signed_in?
  end
end

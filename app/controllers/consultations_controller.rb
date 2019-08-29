class ConsultationsController < ApplicationController
  before_action :redirect_visitor

  def index
    @consultations = []
    if current_user.doctor.nil?
      @my_consultations = current_user.consultations
    else
      @my_consultations = current_user.consultations
      all_consultations = Consultation.all
      all_consultations.each do |consultation|
        @consultations << consultation if consultation.offer.doctor == current_user.doctor
      end
    end
    @my_consultations
    @consultations
    @offer = Offer.new
    @offers = current_user.doctor.offers unless current_user.doctor.nil?
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
    @consultation.offer.available = true
    @consultation.offer.save
    redirect_to consultations_path
  end

  def create
    @offer = Offer.find(params[:offer_id])
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
    redirect_to new_user_registration_path unless user_signed_in?
  end
end

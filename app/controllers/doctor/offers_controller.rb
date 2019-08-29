class Doctor::OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.doctor_id = current_user.id
    if @offer.save
      redirect_to consultations_path
    else
      render '/doctor/offers/new'
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      respond_to do |format|
        format.html { redirect_to consultations_path}
        format.json
      end
    else
      render '/doctor/offers/:id/edit'
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to consultations_path(current_user)
  end

  private

  def offer_params
    params.require(:offer).permit(:start_date, :end_date, :specialty_id)
  end
end

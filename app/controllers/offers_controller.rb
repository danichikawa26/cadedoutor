class OffersController < ApplicationController

  def index
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    respond_to do |format|
      if @offer.save
        render 'doctor'
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    respond_to do |format|
      if @offer.update(offer_params)
        render 'doctor'
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to doctor_path(current_user), notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:start_date, :end_date, :specialty_id)
  end
end

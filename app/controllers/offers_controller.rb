class OffersController < ApplicationController
  def index
  end

  def show
    @offer = Offer.find(params[:id])
  end
end

class ConsultationsController < ApplicationController
  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
  end
end

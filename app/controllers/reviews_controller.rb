class ReviewsController < ApplicationController
  def create
    @doctor = Doctor.find(params[:doctor_id])
    @review = Review.new(review_params)
    @review.doctor = @doctor
    if @review.save
      redirect_to doctor_path(@doctor)
    else
      render "doctors/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

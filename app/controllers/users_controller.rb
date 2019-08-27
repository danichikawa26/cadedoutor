class UsersController < ApplicationController
  def show
    @consultations = User.find(params[:id]).consultations # current_user.id?
  end
end

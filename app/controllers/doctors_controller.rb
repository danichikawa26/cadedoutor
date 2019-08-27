class DoctorsController < ApplicationController

  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
    # if params[:query].present?
    #   @doctors = Doctor.where(doctor.specialty.name: params[:query])
    # else
    #   @doctors = Doctor.all
    # end
  end

  def new
    @specialties = Specialty.all
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.build(user: @current_user)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end

  def show
    set_doctor
  end

  def edit
    @specialties = Specialty.all
    set_doctor
  end

  def update
    set_doctor
    @doctor.save
  end

  def destroy
    set_doctor
    @doctor.destroy
    redirect_to user_path(@current_user)
  end

  private

  def doctor_params
    params.require(:doctor).permit(:professional_register, :address)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end

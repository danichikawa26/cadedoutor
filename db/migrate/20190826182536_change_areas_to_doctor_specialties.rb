class ChangeAreasToDoctorSpecialties < ActiveRecord::Migration[5.2]
  def change
    rename_table :areas, :doctor_specialties
  end
end

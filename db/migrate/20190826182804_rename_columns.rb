class RenameColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :consultations, :user_id, :patient_id
    rename_column :offers, :user_id, :doctor_id
    remove_column :offers, :specialty
    add_reference :offers, :specialty, foreign_key: true
  end
end

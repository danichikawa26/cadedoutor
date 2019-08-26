class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :doctor_specialties, :user_id, :doctor_id
  end
end

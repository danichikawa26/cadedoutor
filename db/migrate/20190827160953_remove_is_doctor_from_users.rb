class RemoveIsDoctorFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :is_doctor, :boolean
  end
end

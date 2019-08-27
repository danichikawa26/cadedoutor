class RemoveProfessionalRegisterFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :professional_register, :string
  end
end

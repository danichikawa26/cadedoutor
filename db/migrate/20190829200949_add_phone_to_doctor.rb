class AddPhoneToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :phone, :string, default: ''
  end
end

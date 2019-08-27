class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.references :user, foreign_key: true
      t.string :professional_register
      t.text :address

      t.timestamps
    end
  end
end

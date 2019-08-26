class CreateConsultations < ActiveRecord::Migration[5.2]
  def change
    create_table :consultations do |t|
      t.references :user, foreign_key: true
      t.references :offer, foreign_key: true
      t.boolean :confirmed

      t.timestamps
    end
  end
end

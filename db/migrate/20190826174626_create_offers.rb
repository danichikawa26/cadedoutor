class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :specialty, foreign_key: true
      t.boolean :available, default: true
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end

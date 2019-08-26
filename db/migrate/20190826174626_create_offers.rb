class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :specialty
      t.boolean :available
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

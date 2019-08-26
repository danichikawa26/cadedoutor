class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.references :user, foreign_key: true
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end

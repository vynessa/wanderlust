class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.string :location
      t.date :departure_date
      t.date :return_date

      t.timestamps
    end
  end
end

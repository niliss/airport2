class CreateDepartures < ActiveRecord::Migration
  def change
    create_table :departures do |t|
      t.string :flight
      t.datetime :date
      t.integer :status

      t.timestamps null: false
    end
  end
end

class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :flight
      t.string :name
      t.string :passport

      t.timestamps null: false
    end
  end
end

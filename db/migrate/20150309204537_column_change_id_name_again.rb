class ColumnChangeIdNameAgain < ActiveRecord::Migration
  def change
  	rename_column :flights, :integer, :airline_id
  	rename_column :arrivals, :integer, :flight_id
  	rename_column :departures, :integer, :flight_id
  	rename_column :passengers, :integer, :flight_id
  end
end

class ColumnTypeToInt < ActiveRecord::Migration
  def change
  	change_column :flights, :airline, :integer
  	change_column :arrivals, :flight, :integer
  	change_column :departures, :flight, :integer
  	change_column :passengers, :flight, :integer
  end
end

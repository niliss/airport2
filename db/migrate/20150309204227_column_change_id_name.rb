class ColumnChangeIdName < ActiveRecord::Migration
  def change
  	rename_column :flights, :airline, :integer
  	rename_column :arrivals, :flight, :integer
  	rename_column :departures, :flight, :integer
  	rename_column :passengers, :flight, :integer
  end
end

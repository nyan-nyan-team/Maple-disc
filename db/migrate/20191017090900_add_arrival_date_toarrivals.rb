class AddArrivalDateToarrivals < ActiveRecord::Migration[5.2]
  def change
    add_column :arrivals, :arrival_date, :date
  end
end

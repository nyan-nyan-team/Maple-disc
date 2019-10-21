class RemoveArrivalDateFromArrivals < ActiveRecord::Migration[5.2]
  def change
    remove_column :arrivals, :arrival_date, :date
  end
end

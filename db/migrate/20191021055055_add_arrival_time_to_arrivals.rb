class AddArrivalTimeToArrivals < ActiveRecord::Migration[5.2]
  def change
    add_column :arrivals, :arrival_time, :datetime
  end
end

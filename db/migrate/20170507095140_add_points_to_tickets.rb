class AddPointsToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :points, :numeric
  end
end

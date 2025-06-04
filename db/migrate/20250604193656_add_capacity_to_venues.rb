class AddCapacityToVenues < ActiveRecord::Migration[8.0]
  def change
    add_column :venues, :capacity, :integer
  end
end

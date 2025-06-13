class AddNameToWedding < ActiveRecord::Migration[8.0]
  def change
    add_column :weddings, :name, :string
  end
end

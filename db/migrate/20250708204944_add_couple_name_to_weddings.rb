class AddCoupleNameToWeddings < ActiveRecord::Migration[8.0]
  def change
    add_column :weddings, :couple_names, :string
  end
end

class CreateWeddings < ActiveRecord::Migration[8.0]
  def change
    create_table :weddings do |t|
      t.timestamps
      t.datetime :date
      t.string :city
      t.string :state
      t.string :dress_code
    end
  end
end

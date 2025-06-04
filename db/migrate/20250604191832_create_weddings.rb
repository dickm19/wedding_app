class CreateWeddings < ActiveRecord::Migration[8.0]
  def change
    create_table :weddings do |t|
      t.timestamps
      t.datetime :date
      t.string :city
      t.string :state
      t.references :user, null: false, foreign_key: true
      t.string :dress_code
    end
  end
end

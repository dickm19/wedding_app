class CreateRegistry < ActiveRecord::Migration[8.0]
  def change
    create_table :registries do |t|
      t.timestamps
      t.string :name
      t.references :wedding, null: false, foreign_key: true
    end
  end
end

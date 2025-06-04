class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name
      t.references :registry, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :description
      t.boolean :purchased, default: false
      t.string :image_url
      t.string :category
      t.string :brand
      t.string :sku
      t.string :item_url
    end
  end
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_04_200321) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "registry_id", null: false
    t.integer "quantity", default: 1
    t.decimal "price", precision: 10, scale: 2, null: false
    t.string "description"
    t.boolean "purchased", default: false
    t.string "image_url"
    t.string "category"
    t.string "brand"
    t.string "sku"
    t.string "item_url"
    t.index ["registry_id"], name: "index_items_on_registry_id"
  end

  create_table "registries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "wedding_id", null: false
    t.index ["wedding_id"], name: "index_registries_on_wedding_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "role", default: "nearlywed", null: false
    t.string "profile_picture_url"
    t.string "rsvp"
  end

  create_table "venues", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.text "description"
    t.bigint "wedding_id", null: false
    t.integer "capacity"
    t.index ["wedding_id"], name: "index_venues_on_wedding_id"
  end

  create_table "weddings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.string "city"
    t.string "state"
    t.bigint "user_id", null: false
    t.string "dress_code"
    t.index ["user_id"], name: "index_weddings_on_user_id"
  end

  add_foreign_key "items", "registries"
  add_foreign_key "registries", "weddings"
  add_foreign_key "venues", "weddings"
  add_foreign_key "weddings", "users"
end

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

ActiveRecord::Schema[8.0].define(version: 2025_07_15_223223) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "attractions", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "park_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "park_id"], name: "index_attractions_on_name_and_park_id", unique: true
    t.index ["park_id"], name: "index_attractions_on_park_id"
    t.check_constraint "length(name::text) > 0", name: "attraction_name_not_empty"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "park_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "park_id"], name: "index_characters_on_name_and_park_id", unique: true
    t.index ["park_id"], name: "index_characters_on_park_id"
    t.check_constraint "length(name::text) > 0", name: "character_name_not_empty"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "park_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "park_id"], name: "index_events_on_name_and_park_id", unique: true
    t.index ["park_id"], name: "index_events_on_park_id"
    t.check_constraint "length(name::text) > 0", name: "event_name_not_empty"
  end

  create_table "modes_of_transportations", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.bigint "resort_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resort_id"], name: "index_modes_of_transportation_on_name_and_resort_id", unique: true
    t.index ["resort_id"], name: "index_modes_of_transportations_on_resort_id"
    t.check_constraint "length(name::text) > 0", name: "transportation_name_not_empty"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.bigint "resort_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resort_id"], name: "index_parks_on_name_and_resort_id", unique: true
    t.index ["resort_id"], name: "index_parks_on_resort_id"
    t.check_constraint "length(name::text) > 0", name: "park_name_not_empty"
  end

  create_table "resort_hotels", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "resort_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resort_id"], name: "index_resort_hotels_on_name_and_resort_id", unique: true
    t.index ["resort_id"], name: "index_resort_hotels_on_resort_id"
    t.check_constraint "length(name::text) > 0", name: "resort_hotel_name_not_empty"
  end

  create_table "resorts", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_resorts_on_name", unique: true
    t.check_constraint "length(name::text) > 0", name: "resort_name_not_empty"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description"
    t.string "locatable_type", null: false
    t.bigint "locatable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_restaurants_on_locatable"
    t.index ["locatable_type", "locatable_id"], name: "index_restaurants_on_locatable_type_and_locatable_id"
    t.index ["name", "locatable_type", "locatable_id"], name: "index_restaurants_on_name_and_locatable", unique: true
    t.check_constraint "length(name::text) > 0", name: "restaurant_name_not_empty"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description"
    t.bigint "park_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "park_id"], name: "index_shows_on_name_and_park_id", unique: true
    t.index ["park_id"], name: "index_shows_on_park_id"
    t.check_constraint "length(name::text) > 0", name: "show_name_not_empty"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 100, null: false
    t.string "last_name", limit: 100, null: false
    t.string "email", limit: 255, null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.check_constraint "length(email::text) > 0", name: "email_not_empty"
    t.check_constraint "length(first_name::text) > 0", name: "first_name_not_empty"
    t.check_constraint "length(last_name::text) > 0", name: "last_name_not_empty"
  end

  add_foreign_key "attractions", "parks"
  add_foreign_key "characters", "parks"
  add_foreign_key "events", "parks"
  add_foreign_key "modes_of_transportations", "resorts"
  add_foreign_key "parks", "resorts"
  add_foreign_key "resort_hotels", "resorts"
  add_foreign_key "shows", "parks"
end

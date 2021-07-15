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

ActiveRecord::Schema.define(version: 2021_07_15_133254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "adminID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brakes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.bigint "oil_id", null: false
    t.bigint "oil_filter_id", null: false
    t.bigint "brake_id", null: false
    t.bigint "rear_light_id", null: false
    t.bigint "tyre_id", null: false
    t.bigint "radiator_coolant_id", null: false
    t.bigint "fuel_pump_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brake_id"], name: "index_cars_on_brake_id"
    t.index ["fuel_pump_id"], name: "index_cars_on_fuel_pump_id"
    t.index ["oil_filter_id"], name: "index_cars_on_oil_filter_id"
    t.index ["oil_id"], name: "index_cars_on_oil_id"
    t.index ["radiator_coolant_id"], name: "index_cars_on_radiator_coolant_id"
    t.index ["rear_light_id"], name: "index_cars_on_rear_light_id"
    t.index ["tyre_id"], name: "index_cars_on_tyre_id"
  end

  create_table "fuel_pumps", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "oil_filters", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "oils", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "radiator_coolants", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rear_lights", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tyres", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "userID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cars", "brakes"
  add_foreign_key "cars", "fuel_pumps"
  add_foreign_key "cars", "oil_filters"
  add_foreign_key "cars", "oils"
  add_foreign_key "cars", "radiator_coolants"
  add_foreign_key "cars", "rear_lights"
  add_foreign_key "cars", "tyres"
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_14_225105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plans", force: :cascade do |t|
    t.string "hazard_weather", default: "nil"
    t.string "hazard_avalanche", default: "nil"
    t.string "hazard_summary", default: "nil"
    t.string "route_preview", default: "nil"
    t.string "route_alternative", default: "nil"
    t.string "emergency_plan", default: "nil"
    t.boolean "checklist", default: false
    t.string "debrief_conditions", default: "nil"
    t.string "debrief_decisions", default: "nil"
    t.string "debrief_plan", default: "nil"
    t.bigint "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_plans_on_tour_id"
  end

  create_table "tour_users", force: :cascade do |t|
    t.bigint "tour_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_tour_users_on_tour_id"
    t.index ["user_id"], name: "index_tour_users_on_user_id"
  end

  create_table "tours", force: :cascade do |t|
    t.datetime "date"
    t.string "location"
    t.integer "creator_id"
    t.boolean "complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email_address"
    t.string "emergency_contact_name", default: "nil"
    t.string "emergency_number", default: "nil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth"
  end

  add_foreign_key "plans", "tours"
  add_foreign_key "tour_users", "tours"
  add_foreign_key "tour_users", "users"
end

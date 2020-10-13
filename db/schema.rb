# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_08_094816) do

  create_table "superheros", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "power_level"
    t.string "full_name"
    t.string "place_of_birth"
    t.string "publisher"
    t.string "alignment"
    t.string "team_affiliation"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_superheros", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "superhero_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["superhero_id"], name: "index_team_superheros_on_superhero_id"
    t.index ["team_id"], name: "index_team_superheros_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "team_superheros", "superheros"
  add_foreign_key "team_superheros", "teams"
  add_foreign_key "teams", "users"
end

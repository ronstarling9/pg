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

ActiveRecord::Schema.define(version: 20180212051050) do

  create_table "algorithms", force: :cascade do |t|
    t.string "name", limit: 15
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_algorithms_on_name", unique: true
  end

  create_table "guess_confirmations", force: :cascade do |t|
    t.float "height"
    t.float "weight"
    t.string "algorithm"
    t.boolean "is_correct"
    t.string "guess"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guess_criteria", force: :cascade do |t|
    t.float "height"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tastes", force: :cascade do |t|
    t.float "height"
    t.float "weight"
    t.integer "preference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

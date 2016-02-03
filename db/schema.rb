# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160125045057) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "user_id"
    t.string   "name"
    t.float    "hours"
    t.datetime "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bookings", ["property_id"], name: "index_bookings_on_property_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "numberunit"
    t.string   "street"
    t.string   "suburb"
    t.string   "postcode"
    t.string   "phone"
    t.integer  "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

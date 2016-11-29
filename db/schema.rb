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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161028072031) do
=======
ActiveRecord::Schema.define(version: 20161123091856) do
>>>>>>> refs/remotes/origin/master

  create_table "bookings", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "location_id"
    t.integer  "user_id"
    t.integer  "task_id"
    t.string   "name"
    t.float    "hours"
    t.datetime "booked_time"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "description"
    t.string   "externalref"
  end

  add_index "bookings", ["customer_id"], name: "index_bookings_on_customer_id"
  add_index "bookings", ["location_id"], name: "index_bookings_on_location_id"
  add_index "bookings", ["task_id"], name: "index_bookings_on_task_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "cases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "suburb"
    t.string   "state"
    t.integer  "postcode"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "invoiceNum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "start_user"
    t.integer  "end_user"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["customer_id"], name: "index_locations_on_customer_id"

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

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.boolean  "is_admin"
    t.boolean  "is_staff"
    t.integer  "booking_id"
    t.integer  "customer_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["booking_id"], name: "index_users_on_booking_id"
  add_index "users", ["customer_id"], name: "index_users_on_customer_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

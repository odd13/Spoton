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

ActiveRecord::Schema.define(version: 20181230055922) do

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
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["location_id"], name: "index_bookings_on_location_id"
    t.index ["task_id"], name: "index_bookings_on_task_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
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
    t.string   "work_type"
    t.string   "cust_name"
    t.string   "cust_address"
    t.decimal  "price"
    t.decimal  "tax"
    t.integer  "parent_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["parent_id"], name: "index_invoices_on_parent_id", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_locations_on_customer_id"
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
    t.index ["booking_id"], name: "index_users_on_booking_id"
    t.index ["customer_id"], name: "index_users_on_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

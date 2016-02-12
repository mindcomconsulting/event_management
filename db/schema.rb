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

ActiveRecord::Schema.define(version: 20160212220013) do

  create_table "book_events", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "booking_id",   limit: 255
    t.integer  "function_id",  limit: 4
    t.integer  "venue_id",     limit: 4
    t.integer  "no_of_guest",  limit: 4
    t.date     "date"
    t.integer  "total_amount", limit: 4
    t.string   "status",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "event_details", force: :cascade do |t|
    t.integer  "venu_id",       limit: 4
    t.integer  "price_id",      limit: 4
    t.integer  "phone_number",  limit: 4
    t.integer  "mobile_number", limit: 4
    t.integer  "capacity",      limit: 4
    t.integer  "function_id",   limit: 4
    t.string   "image",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "function_details", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "function_equipments", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "book_event_id",      limit: 4
    t.boolean  "dj"
    t.boolean  "stage"
    t.boolean  "mike_speaker"
    t.boolean  "break_fast"
    t.boolean  "lunch"
    t.boolean  "tea_snack"
    t.boolean  "dinner"
    t.string   "food_type",          limit: 255
    t.string   "lunch_type",         limit: 255
    t.string   "dinner_type",        limit: 255
    t.string   "light_type",         limit: 255
    t.string   "flower_type",        limit: 255
    t.string   "sitting_chair_type", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "image",          limit: 255
    t.string   "title",          limit: 255
    t.integer  "imageable_id",   limit: 4
    t.string   "imageable_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "price",       limit: 4
    t.integer  "function_id", limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "user_name",              limit: 255
    t.string   "first_name",             limit: 255
    t.string   "middle_name",            limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "mobile_no",              limit: 8
    t.text     "address",                limit: 65535
    t.string   "user_type",              limit: 255
    t.string   "user_login_type",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "address",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end

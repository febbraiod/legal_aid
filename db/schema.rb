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

ActiveRecord::Schema.define(version: 20160421140314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "case_workers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cases", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "index_num"
    t.string   "county"
    t.text     "caption"
    t.boolean  "open",       default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "exposure"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.string   "email"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "case_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cell_phone"
    t.string   "user_type"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email",                  default: "",    null: false
    t.integer  "role"
    t.boolean  "approved",               default: false, null: false
    t.string   "provider"
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

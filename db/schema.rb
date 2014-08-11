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

ActiveRecord::Schema.define(version: 20140809012842) do

  create_table "supplies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_supplies", force: true do |t|
    t.integer  "trip_id"
    t.integer  "supply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trip_supplies", ["supply_id"], name: "index_trip_supplies_on_supply_id"
  add_index "trip_supplies", ["trip_id"], name: "index_trip_supplies_on_trip_id"

  create_table "trips", force: true do |t|
    t.string   "trip_name"
    t.string   "location"
    t.string   "date"
    t.integer  "user_id"
    t.text     "to_pack"
    t.text     "to_do"
    t.integer  "budget"
    t.text     "things_i_did"
    t.text     "things_i_liked"
    t.text     "things_i_didnt_like"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "image"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

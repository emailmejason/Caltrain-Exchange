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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130813013923) do

  create_table "offers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "train_id"
    t.string   "on_station"
    t.string   "off_station"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "on_station_time"
    t.string   "off_station_time"
  end

  create_table "shares", :force => true do |t|
    t.integer  "trip_id"
    t.integer  "offer_id"
    t.integer  "wifi_rating"
    t.integer  "user_rating"
    t.string   "network_name"
    t.string   "network_password"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "trains", :force => true do |t|
    t.string   "direction"
    t.string   "number"
    t.hstore   "schedule"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trains", ["schedule"], :name => "index_trains_on_schedule"

  create_table "trips", :force => true do |t|
    t.integer  "user_id"
    t.integer  "train_id"
    t.string   "on_station"
    t.string   "off_station"
    t.integer  "wifi_duration"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "on_station_time"
    t.string   "off_station_time"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                     :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end

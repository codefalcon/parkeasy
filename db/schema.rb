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

ActiveRecord::Schema.define(:version => 20131018144221) do

  create_table "parking_lot_bookings", :force => true do |t|
    t.integer  "number_of_lots_booked"
    t.integer  "booking_type_id"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.decimal  "payment_amount",        :precision => 10, :scale => 0
    t.string   "payment_reference"
    t.integer  "user_id"
    t.integer  "parking_space_lot_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "parking_lot_bookings", ["parking_space_lot_id"], :name => "index_parking_lot_bookings_on_parking_space_lot_id"
  add_index "parking_lot_bookings", ["user_id"], :name => "index_parking_lot_bookings_on_user_id"

  create_table "parking_space_lot_prices", :force => true do |t|
    t.decimal  "price_per_hour",       :precision => 10, :scale => 0
    t.decimal  "price_per_day",        :precision => 10, :scale => 0
    t.decimal  "price_per_fortnight",  :precision => 10, :scale => 0
    t.decimal  "price_per_month",      :precision => 10, :scale => 0
    t.integer  "parking_space_lot_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "parking_space_lot_prices", ["parking_space_lot_id"], :name => "index_parking_space_lot_prices_on_parking_space_lot_id"

  create_table "parking_space_lots", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "allowed_vehicle_type_id"
    t.integer  "number_of_lots"
    t.integer  "preferred_duration_type_id"
    t.integer  "parking_space_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "parking_space_lots", ["parking_space_id"], :name => "index_parking_space_lots_on_parking_space_id"

  create_table "parking_spaces", :force => true do |t|
    t.text     "location_address"
    t.decimal  "location_x",       :precision => 10, :scale => 0
    t.decimal  "location_y",       :precision => 10, :scale => 0
    t.integer  "user_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "contact_number"
    t.string   "place"
  end

  add_index "parking_spaces", ["user_id"], :name => "index_parking_spaces_on_user_id"

  create_table "user_infos", :force => true do |t|
    t.text     "address"
    t.integer  "proof_type_id"
    t.string   "proof_id"
    t.boolean  "is_admin"
    t.boolean  "is_trusted"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "user_infos", ["user_id"], :name => "index_user_infos_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

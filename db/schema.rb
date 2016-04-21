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

ActiveRecord::Schema.define(version: 20160421173046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "uuid-ossp"

  create_table "applies", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "borrowing_amount"
    t.string   "days_to_borrow"
    t.datetime "card_exp_date"
    t.string   "card_cvv"
    t.string   "america_experss_cvv"
    t.string   "card_company"
    t.string   "card_issuer"
    t.string   "card_website_address"
    t.string   "log_on_username"
    t.string   "log_on_pwd"
    t.integer  "card_limit"
    t.integer  "total_limit"
    t.integer  "outstanding_balance"
    t.integer  "advance_limit"
    t.string   "advance_APR"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "social_security_number"
    t.string   "card_number"
    t.string   "relationship_to_creditcard"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "borrowing_amount"
    t.integer  "advance_APR"
    t.integer  "number_of_days"
    t.integer  "amount"
    t.integer  "wirefee"
    t.integer  "cardprocessingfee"
    t.boolean  "quickest"
    t.boolean  "cheapest"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "received_money"
    t.string   "interest_amount"
    t.integer  "dicount_or_premium"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "phonenumber"
    t.string   "address"
    t.boolean  "admin"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
